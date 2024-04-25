// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/strings.dart';
import '../student_app/app/views/home.dart';
import '../read_dir_data.dart';
import '../../test.dart';
import '../../test_eight.dart';
import '../../test_seven.dart';
import '../../test_six.dart';
import '../share_multi.dart';
import '../../record_and_share.dart';
import '../../video_player.dart';
import '../camera/camera_view.dart';

class NavigatorBottomBarCnr extends GetxController {
  String title = homeTitle;
  final List<Widget> pages = [
    HomePage(),
    MyAppTwo(),
    MyAppTwo(),
    MyAppTwo(),
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
