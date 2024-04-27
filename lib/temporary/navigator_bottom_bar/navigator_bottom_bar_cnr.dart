import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/strings.dart';
import '../record_and_share.dart';
import '../../app/views/home.dart';
import '../test_nine.dart';
import '../test_eight.dart';

class NavigatorBottomBarCnr extends GetxController {
  String title = homeTitle;
  final List<Widget> pages = [
    HomePage(),
    HomePageTwo(),
    HomePageTwo(),
    HomePageTwo(),
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
