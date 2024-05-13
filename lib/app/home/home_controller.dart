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
import '../add_data/views/admin_products.view.dart';
import '../login/login_view.dart';

class HomeController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _targetCollection = 'kenya@email.com';
  late CachedVideoPlayerPlusController videoController;
  late CachedVideoPlayerPlusController videoPlayerController;
  final currentUser = FirebaseAuth.instance.currentUser?.email;
  String get targetCollection => _targetCollection;
  void navigateToAddOrder(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AdminProductsView()));
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
    Get.to(const LoginView());
  }

  Future<void> shareOrder(collection, orderId) async {
    showCustomSnackBar(
        title: 'مشاركة الطلب',
        message: 'جاري مشاركة الطلب',
        duration: const Duration(seconds: 2));
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

      await Share.shareFiles(
        [
          videoFile.path,
          firstImagFile.path,
          secondImageFile.path,
        ],
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while downloading file: $e');
      }
    }
  }

  Future<void> shareLocationOnWhatsApp(
      String orderPlace, GeoPoint location) async {
    double latitude = location.latitude;
    double longitude = location.longitude;
    String locationUrl = "https://maps.google.com/?q=$latitude,$longitude";
    String combinedMessage = "المكان :$orderPlace\n${locationUrl}";
    await Share.share(
      combinedMessage,
    );
  }

  Future<void> shareOrderTwo(collection, orderId, location) async {
    showCustomSnackBar(
        title: 'مشاركة الطلب',
        message: 'جاري مشاركة الطلب',
        duration: const Duration(seconds: 2));
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

  static showCustomSnackBar(
      {required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.share_rounded,
        color: Colors.white,
      ),
    );
  }
}
