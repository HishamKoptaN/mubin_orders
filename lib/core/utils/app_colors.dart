import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xff016037);
  static const Color lightPrimaryColor = Color(0xff37C860);
  static const Color darkPrimaryColor = Color(0xff043133);
  static const Color backgroundAppColor = Color(0xffFAFAFA);
  static const Color lightGreyColor = Color(0xffEFF0F2);
  static const Color darkGreyColor = Color(0xff838383);
  static const Color moreDarkGreyColor = Color(0xff4D5959);
  static const Color veryMoreDarkGreyColor = Color(0xff5D5D5D);

  //
  static const Color customRed = Color(0xffD92728);
  static const Color secondaryColor = Color(0xFF09AFE1);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color offWhiteColor = Color(0xFFF6F6F6);
  static const Color blackColor = Color(0xFF101010);
  static const Color greyColor = Color(0xFF484C52);
  static const Color redColor = Color(0xFFEB5757);
  static const Color orangeColor = Color(0xFFFFB319);
  static const Color yellowColor = Color(0xFFFFD465);
  static const Color greenColor = Colors.green; // Gradients
  static const Color iconColor = Color(0xffa8a09b);
  static const Color correctColor = Colors.green;
  static const Color inCorrectColor = Colors.red;
  static const Color naturalColor = Colors.white;
  static const Color backGroundColor = Colors.white;
  static const Gradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
