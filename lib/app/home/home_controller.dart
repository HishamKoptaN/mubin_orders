import 'dart:io';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../add_data/views/add_new_product.widget.dart';
import '../login/login_view.dart';
import '../video_player.dart';
import 'home_view.dart';

class HomeProvider extends ChangeNotifier {
  late String _title;
  int _currentIndex = 0;
  late List<Widget> _pages;

  String get title => _title;
  int get currentIndex => _currentIndex;
  List<Widget> get pages => _pages;
  Future<void> getCurrentUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .get();
    name = userSnapshot.data()?['name'];
  }

  NavigatorBottomBarCnr() {
    _title = 'Home';
    _pages = [
      HomeView(),
      const AddNewProduct(),
    ];
  }

  void setCurrentIndex(int index, BuildContext context) async {
    switch (index) {
      case 0:
        _title = S.of(context).home_title;
        break;
      case 1:
        _title = S.of(context).add_order;
        break;
    }
    _currentIndex = index;
    notifyListeners();
  }

  //                     /////////////////////
  double xAlign = 0;
  Color arabicColor = Colors.black54;
  Color englishColor = Colors.white;
  bool isArabic = false;

  /////////////////////////////////////////////////////

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _targetCollection = '';
  late CachedVideoPlayerPlusController videoController;
  late CachedVideoPlayerPlusController videoPlayerController;
  final currentUser = FirebaseAuth.instance.currentUser?.email;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  var name = '';

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String get targetCollection => _targetCollection;
  void navigateToAddOrder(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddNewProduct()));
  }

  String videoUrl = '';
  Future<void> initVideo() async {
    videoController = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        videoUrl,
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 10),
    )..initialize().then(
        (value) async {
          await videoController.setLooping(false);
        },
      );
  }

  Future getCurrentUser() async {
    final currentUser = FirebaseAuth.instance.currentUser?.email;
    _targetCollection = currentUser!;
  }

  void shareOrderDataToWhatsApp(Map<String, dynamic> orderData) async {
    String orderText = '';
    orderData.forEach(
      (key, value) {
        orderText += '$key: $value\n';
      },
    );

    final String whatsappUrl =
        'https://wa.me/?text=${Uri.encodeFull(orderText)}';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.to(LoginView());
  }

  goToVideoView(context, document, width, height) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(
          videoUrl: document,
        ),
      ),
    );
  }

  Future<void> shareOrder(
    collection,
    orderId,
  ) async {
    Reference videoRef;
    Reference firstImageRef;
    Reference secondImageRef;
    try {
      setLoading(true);
      final storageRef = FirebaseStorage.instance.ref();
      videoRef = storageRef.child("$collection/$orderId/video.mp4");
      firstImageRef = storageRef.child("$collection/$orderId/first_image.jpg");
      secondImageRef =
          storageRef.child("$collection/$orderId/second_image.jpg");
      final dir = await getApplicationDocumentsDirectory();
      final videoFile = File('${dir.path}/${videoRef.name}.mp4');
      final firstImagFile = File('${dir.path}/${firstImageRef.name}.jpg');
      final secondImageFile = File('${dir.path}/${secondImageRef.name}.jpg');
      await videoRef.writeToFile(videoFile);
      await firstImageRef.writeToFile(firstImagFile);
      await secondImageRef.writeToFile(secondImageFile);

      await Share.shareFiles(
        [
          videoFile.path,
          firstImagFile.path,
          secondImageFile.path,
        ],
      );
    } catch (e) {
      setLoading(false);
      if (kDebugMode) {
        print('Error occurred while downloading file: $e');
      }
    } finally {
      setLoading(false);
    }
  }

  Future<void> shareLocationOnWhatsApp(
      String orderPlace, GeoPoint location) async {
    try {
      setLoading(true);
      double latitude = location.latitude;
      double longitude = location.longitude;
      String locationUrl = "https://maps.google.com/?q=$latitude,$longitude";
      String combinedMessage = "المكان :$orderPlace\n${locationUrl}";
      await Share.share(
        combinedMessage,
      );
    } catch (e) {
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }

  Future<void> shareOrderTwo(collection, orderId, location, context) async {
   
    Reference videoRef;
    Reference firstImageRef;
    Reference secondImageRef;
    try {
      final storageRef = FirebaseStorage.instance.ref();
      videoRef = storageRef.child("$collection/$orderId/video.mp4");
      firstImageRef = storageRef.child("$collection/$orderId/first_image.jpg");
      secondImageRef =
          storageRef.child("$collection/$orderId/second_image.jpg");
      final dir = await getApplicationDocumentsDirectory();
      final videoFile = File('${dir.path}/${videoRef.name}.mp4');
      final firstImagFile = File('${dir.path}/${firstImageRef.name}.jpg');
      final secondImageFile = File('${dir.path}/${secondImageRef.name}.jpg');
      await videoRef.writeToFile(videoFile);
      await firstImageRef.writeToFile(firstImagFile);
      await secondImageRef.writeToFile(secondImageFile);
      String orderLocation =
          "Check out place location:\nhttps://maps.google.com/?q=$location";
      await Share.shareFiles(
        [
          // videoFile.path,
          // firstImagFile.path,
          // secondImageFile.path,
        ],
        text: orderLocation,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while downloading file: $e');
      }
    }
  }

}
