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


  
static const primary = Color(0xFFFFBF00);
static const secondary = Color.fromARGB(255, 255, 199, 33);
static const third = Color(0xFFf39c12);

// Color Theme.of(context).primaryColor =
//     Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16));

// Color secondary =
//     Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16))
//         .withAlpha(200);
// Color third =
//     Color(int.parse(Storage.getString('color') ?? "FFBF00", radix: 16))
//         .withAlpha(230);

static const black = Colors.black;
static const white = Colors.white;

static const danger = Color.fromRGBO(255, 115, 115, 1);

static const List colors = [
  Color(0xFFFFBF00),
  Color(0xFF1abc9c),
  Color(0xFF3498db),
  Color(0xFF9b59b6),
  Color(0xFF34495e),
  Color(0xFFe67e22),
  Color(0xFFf39c12),
  Color(0xFF7f8c8d),
  Color(0xFF2980b9),
  Color(0xFFc0392b),
  Color(0xFFd35400),
  Color(0xFF16a085),
  Color(0xFFf1c40f),
  Color(0xFF2c3e50),
  Color(0xFFe84393),
  Color(0xFF2d3436),
  Color(0xFFff7675),
  Color(0xFFfdcb6e),
  Color(0xFFa29bfe),
  Color(0xFF74b9ff),
];

}
