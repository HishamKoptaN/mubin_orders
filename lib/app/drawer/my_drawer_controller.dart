import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_view.dart';

class MyDrawerController extends GetxController {
  var name = '';
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  double loginAlign = -1;
  double signInAlign = 1;
  Color selectedColor = Colors.white;
  Color normalColor = Colors.black54;
  bool isArabic = false;
  var locale = const Locale('en', 'US');
  String currentLocale = '';
  double width = 300.0;
  double height = 60.0;
  @override
  void onInit() {
    super.onInit();
    setAlignment();
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  setAlignment() {
    currentLocale = Intl.getCurrentLocale();

    if (currentLocale == 'ar') {
      xAlign = signInAlign;
      isArabic = true;
    } else if (currentLocale == 'en') {
      xAlign = loginAlign;
      isArabic = false;
    }
  }

  Future<void> getCurrentUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .get();
    name = userSnapshot.data()?['name'];
  }

  Future<void> selectAr() async {
    changeLocale('ar');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_language', 'ar');
    if (kDebugMode) {
      print('ar');
    }
    xAlign = signInAlign;
    signInColor = selectedColor;
    loginColor = normalColor;
  }

  Future<void> selectEn() async {
    changeLocale('en');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_language', 'en');
    if (kDebugMode) {
      print('en');
      print('Current Lang is : $currentLocale');
    }
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  void changeLocale(String langCode) {
    locale = Locale(langCode);
    Get.updateLocale(locale);
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    Get.to(const LoginView());
  }
}
