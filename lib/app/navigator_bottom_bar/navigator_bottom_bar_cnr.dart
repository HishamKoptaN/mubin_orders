import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/strings.dart';
import '../../student_app/app/views/home.dart';
import '../camera/camera_view.dart';

class NavigatorBottomBarCnr extends GetxController {
  String title = homeTitle;
  final List<Widget> pages = [
    const VideoRecordingScreen(),
    const HomePage(),
    const VideoRecordingScreen(),
  ];
  int currentIndex = 0;
  void setCurrentIndex(int index) async {
    switch (index) {
      case 0:
        title = favoriteTitle;
      case 1:
        title = ordersTitle;
      case 2:
        title = homeTitle;
    }
    currentIndex = index;
    update();
  }
}
