import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../add_data/controllers/admin_products.controller.dart';
import '../add_data/views/admin_products.view.dart';
import '../home/home_view.dart';
import '../login/login_view.dart';
import '../../generated/l10n.dart';

class NavigatorBottomBarCnr extends GetxController {
  String title = 'Home';
  final addData = AdminProductsController();
  @override
  void onInit() async {
    await getCurrentUser();
    isArabic();
    setCurrentIndex;
    super.onInit();
  }

  Future<void> isArabic() async {
    if (Intl.getCurrentLocale() == 'ar') {
      title = 'الرئيسيه';
    } else {
      title = 'Home';
    }
  }

  Future<void> getCurrentUser() async {
    final currentUserRole = FirebaseAuth.instance.currentUser?.email;
    switch (currentUserRole) {
      case 'somal@email.com':
        addData.targetCollection = 'somal_orders';
      case 'kinia@email.com':
        addData.targetCollection = 'kinia_orders';
      case 'tanzania@email.com':
        addData.targetCollection = 'tanzania_orders';
    }
  }

  final List<Widget> pages = [
    HomeView(),
    const AdminProductsView(),
  ];

  int currentPagesIndex = 0;
  void setCurrentIndex(int index, context) async {
    switch (index) {
      case 0:
        currentPagesIndex = index;
        title = S.of(context).home_title;

      case 1:
        currentPagesIndex = index;
        title = S.of(context).add_order;
    }
    currentPagesIndex = index;
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
