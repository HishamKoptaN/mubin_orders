import 'dart:convert';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../generated/l10n.dart';
import '../../../core/helper/routes.dart';
import '../../add_order/views/add_order_view.dart';
import '../../video_player.dart';
import 'package:http/http.dart' as http;

class HomeController {
  late String _title;
  int _currentIndex = 0;
  late List<Widget> _pages;

  String get title => _title;
  int get currentIndex => _currentIndex;
  List<Widget> get pages => _pages;

  Future<Map<String, dynamic>> fetchOrders() async {
    final response = await http.get(
      Uri.parse(api['orders']!),
      // headers: await LoginController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(response.reasonPhrase);
    }
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
  }

  //                     /////////////////////
  double xAlign = 0;
  Color arabicColor = Colors.black54;
  Color englishColor = Colors.white;
  bool isArabic = false;

  /////////////////////////////////////////////////////

  String _targetCollection = '';
  late CachedVideoPlayerPlusController videoController;
  late CachedVideoPlayerPlusController videoPlayerController;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  var name = '';

  void setLoading(bool value) {
    _isLoading = value;
  }

  String get targetCollection => _targetCollection;
  void navigateToAddOrder(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddOrderView()));
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

  // Future<void> shareOrder(
  //   collection,
  //   orderId,
  // ) async {
  //   Reference videoRef;
  //   Reference firstImageRef;
  //   Reference secondImageRef;
  //   try {
  //     setLoading(true);
  //     final storageRef = FirebaseStorage.instance.ref();
  //     videoRef = storageRef.child("$collection/$orderId/video.mp4");
  //     firstImageRef = storageRef.child("$collection/$orderId/first_image.jpg");
  //     secondImageRef =
  //         storageRef.child("$collection/$orderId/second_image.jpg");
  //     final dir = await getApplicationDocumentsDirectory();
  //     final videoFile = File('${dir.path}/${videoRef.name}.mp4');
  //     final firstImagFile = File('${dir.path}/${firstImageRef.name}.jpg');
  //     final secondImageFile = File('${dir.path}/${secondImageRef.name}.jpg');
  //     await videoRef.writeToFile(videoFile);
  //     await firstImageRef.writeToFile(firstImagFile);
  //     await secondImageRef.writeToFile(secondImageFile);

  //     await Share.shareFiles(
  //       [
  //         videoFile.path,
  //         firstImagFile.path,
  //         secondImageFile.path,
  //       ],
  //     );
  //   } catch (e) {
  //     setLoading(false);
  //     if (kDebugMode) {
  //       print('Error occurred while downloading file: $e');
  //     }
  //   } finally {
  //     setLoading(false);
  //   }
  // }

  // Future<void> shareLocationOnWhatsApp(
  //     String orderPlace, GeoPoint location) async {
  //   try {
  //     setLoading(true);
  //     double latitude = location.latitude;
  //     double longitude = location.longitude;
  //     String locationUrl = "https://maps.google.com/?q=$latitude,$longitude";
  //     String combinedMessage = "المكان :$orderPlace\n${locationUrl}";
  //     await Share.share(
  //       combinedMessage,
  //     );
  //   } catch (e) {
  //     setLoading(false);
  //   } finally {
  //     setLoading(false);
  //   }
  // }

  // Future<void> shareOrderTwo(collection, orderId, location, context) async {
  //   Reference videoRef;
  //   Reference firstImageRef;
  //   Reference secondImageRef;
  //   try {
  //     final storageRef = FirebaseStorage.instance.ref();
  //     videoRef = storageRef.child("$collection/$orderId/video.mp4");
  //     firstImageRef = storageRef.child("$collection/$orderId/first_image.jpg");
  //     secondImageRef =
  //         storageRef.child("$collection/$orderId/second_image.jpg");
  //     final dir = await getApplicationDocumentsDirectory();
  //     final videoFile = File('${dir.path}/${videoRef.name}.mp4');
  //     final firstImagFile = File('${dir.path}/${firstImageRef.name}.jpg');
  //     final secondImageFile = File('${dir.path}/${secondImageRef.name}.jpg');
  //     await videoRef.writeToFile(videoFile);
  //     await firstImageRef.writeToFile(firstImagFile);
  //     await secondImageRef.writeToFile(secondImageFile);
  //     String orderLocation =
  //         "Check out place location:\nhttps://maps.google.com/?q=$location";
  //     await Share.shareFiles(
  //       [
  //         // videoFile.path,
  //         // firstImagFile.path,
  //         // secondImageFile.path,
  //       ],
  //       text: orderLocation,
  //     );
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error occurred while downloading file: $e');
  //     }
  //   }
  // }
}
