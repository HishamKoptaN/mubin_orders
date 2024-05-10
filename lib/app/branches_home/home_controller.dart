import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_view.dart';

class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CachedVideoPlayerPlusController videoController;
  late CachedVideoPlayerPlusController videoPlayerController;

  bool isLoading = false;
  String videoUrl = '';
  int currentIndex = 1;
  String targetBranch = 'somal_orders';
  String currentLocale = '';
  bool isAraby = false;
  bool iSvideoPlaying = false;
  @override
  void onInit() {
    super.onInit();
    getCurrentLang();
  }

  getCurrentLang() {
    currentLocale = Intl.getCurrentLocale();

    if (currentLocale == 'ar') {
      isAraby = true;
    } else if (currentLocale == 'en') {
      isAraby = false;
    }
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  List branchArData = [
    {
      'branch_collection': 'kinia_orders',
      'name': 'كينيا',
      'flag': 'KE',
    },
    {
      'branch_collection': 'tanzania_orders',
      'name': 'تنزانيا',
      'flag': 'TZ',
    },
    {
      'branch_collection': 'malawi_orders',
      'name': 'مالاوي',
      'flag': 'MW',
    },
    {
      'branch_collection': 'cameroun_orders',
      'name': 'الكاميرون',
      'flag': 'CM',
    },
    {
      'branch_collection': 'benin_orders',
      'name': 'بنين',
      'flag': 'BJ',
    },
    {
      'branch_collection': 'ghana_orders',
      'name': 'Ghana',
      'flag': 'GA',
    },
    {
      'branch_collection': 'guinee_orders',
      'name': 'غينيا',
      'flag': 'GN',
    },
  ];
  List branchEnData = [
    {
      'branch_collection': 'kinia_orders',
      'name': 'Kinia',
      'flag': 'KE',
    },
    {
      'branch_collection': 'tanzania_orders',
      'name': 'Tanzania',
      'flag': 'TZ',
    },
    {
      'branch_collection': 'malawi_orders',
      'name': 'Malawi',
      'flag': 'MW',
    },
    {
      'branch_collection': 'cameroun_orders',
      'name': 'Cameroun',
      'flag': 'CM',
    },
    {
      'branch_collection': 'benin_orders',
      'name': 'Bénin',
      'flag': 'BJ',
    },
    {
      'branch_collection': 'ghana_orders',
      'name': 'Ghana',
      'flag': 'GH',
    },
    {
      'branch_collection': 'guinee_orders',
      'name': 'Guinée',
      'flag': 'GN',
    },
  ];
  Future<void> setCurrentIndex(int index) async {
    currentIndex = index;

    switch (index) {
      case 0:
        targetBranch = branchArData[0]['branch_collection'];
        update();

      case 1:
        targetBranch = branchArData[1]['branch_collection'];
        update();

      case 2:
        targetBranch = branchArData[2]['branch_collection'];
        update();
      case 3:
        targetBranch = branchArData[2]['branch_collection'];
        update();
      case 4:
        targetBranch = branchArData[2]['branch_collection'];
        update();
      case 5:
        targetBranch = branchArData[2]['branch_collection'];
        update();
      case 6:
        targetBranch = branchArData[2]['branch_collection'];
        update();
    }
  }

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    // update();
  }

  Future<void> initVideo(videoUrl) async {
    videoController = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        videoUrl,
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 2),
    )..initialize().then(
        (value) async {
          await videoController.setLooping(false);
        },
      );
  }

  Future<void> displayVideo(String urlVideo) async {
    videoPlayerController = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        urlVideo,
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 3),
    )..initialize().then(
        (value) async {
          await videoPlayerController.setLooping(true);
          await videoPlayerController.play();
          iSvideoPlaying == true;
        },
      );
  }

  Future<void> playVideo() async {
    await videoPlayerController.play();
    iSvideoPlaying == true;
    update();
  }

  Future<void> pauseVideo() async {
    await videoPlayerController.pause();
    iSvideoPlaying == false;
    update();
  }

  Future<void> replayVideo() async {
    await videoPlayerController.seekTo(Duration.zero);
    await videoPlayerController.play();
  }

  Future<void> shareOrder(collection, orderId, location) async {
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

  void deleteFile(String path) async {
    try {
      Reference storageRef = FirebaseStorage.instance.ref().child(path);
      await storageRef.delete();
      if (kDebugMode) {
        print('تم حذف الملف بنجاح');
      }
    } catch (e) {
      if (kDebugMode) {
        print('حدث خطأ أثناء حذف الملف: $e');
      }
    }
  }

  void main() {
    deleteFile('path/to/your/file.jpg');
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    Get.off(const LoginView());
  }

  // Future<void> shareVideo(
  //   String place,
  //   String videoPath,
  //   String firstImagePath,
  //   String secondImagePath,
  //   double orderLocation,
  // ) async {
  //   String message =
  //       "Check out my location:\nhttps://maps.google.com/?q=$orderLocation";
  //   var videoFile = File(videoPath);
  //   var firstImageFile = File(firstImagePath);
  //   var secondImageFile = File(secondImagePath);
  //   String placeAddress = 'المكان : ${place.toString()}';
  //   if (videoFile.existsSync() &&
  //       firstImageFile.existsSync() &&
  //       secondImageFile.existsSync()) {
  //     await Share.shareFiles(
  //       [videoPath, firstImagePath, secondImagePath],
  //     );
  //   } else {
  //     print('One or more files do not exist!');
  //   }
  // }

  // void deleteFile(String path) async {
  //   try {
  //     Reference storageRef = FirebaseStorage.instance.ref().child(path);
  //     await storageRef.delete();
  //     print('تم حذف الملف بنجاح');
  //   } catch (e) {
  //     print('حدث خطأ أثناء حذف الملف: $e');
  //   }
  // }

  // void main() {
  //   deleteFile('path/to/your/file.jpg');
  // }
}
