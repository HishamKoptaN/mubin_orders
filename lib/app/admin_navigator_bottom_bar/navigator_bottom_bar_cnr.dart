import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helpers/strings.dart';
import '../../test._two.dart';
import '../../test_one.dart';
import '../home/home_controller.dart';
import '../home/home_view.dart';
import '../login/login_view.dart';

class NavigatorBottomBarCnr extends GetxController {
  String title = homeTitle;
  bool isAdmin = false;
  String currentUser = '';
  final homeController = Get.put(HomeProvider());
  @override
  void onInit() async {
    super.onInit();
    homeController.targetBranch = 'Kenya@email.com';
  }

  final List<Widget> pages = [
    HomeView(),
    const LoginView(),
    CachedVideosList(),
    CachedVideosList(),
  ];

  int currentAdminPagesIndex = 0;
  void setCurrentAdminIndex(int index) async {
    switch (index) {
      case 0:
        title = branchsTitle;
      case 1:
        title = ordersAddTitle;
    }
    currentAdminPagesIndex = index;
    update();
  }

  int branchPagesIndex = 0;
  void setCurrentBranchIndex(int index) async {
    switch (index) {
      case 0:
        title = branchsTitle;
      case 1:
        title = ordersAddTitle;
    }
    branchPagesIndex = index;
    update();
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    Get.to(const LoginView());
  }
}
