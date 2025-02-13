// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../main.dart';
// import '../../app/bottom_navigate/navigator_bottom_bar_view.dart'w.dart';

// final LocalAuthentication auth = LocalAuthentication();

// class LoginProvider {
//   final homeController = HomeController();
//   final TextEditingController loginEmailController = TextEditingController();
//   final TextEditingController loginPassController = TextEditingController();
//   bool isChecked = false;
//   double width = 300.0;
//   double height = 60.0;
//   double xAlign = -1;
//   Color englishColor = Colors.white;
//   Color arabicColor = Colors.black54;
//   TextEditingController registerNamelController = TextEditingController();
//   TextEditingController registerEmailController = TextEditingController();
//   TextEditingController registerPasswordController = TextEditingController();
//   TextEditingController registerConfirmPasswordController =
//       TextEditingController();
//   TextEditingController registerPhoneNumberController = TextEditingController();
//   TextEditingController emailPassResetController = TextEditingController();
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   static const String emailKey = 'email';
//   static const String passwordKey = 'password';
//   bool? showWhat;
//   bool firstTimeLogin = true;
//   bool registerIsExtended = false;
//   bool loginIsExtended = false;
//   bool firstTime = false;
//   int toggleValue = 0;
//   String selectedLanguage = 'en';
//   double loginAlign = -1;
//   double signInAlign = 1;
//   Color selectedColor = Colors.white;
//   Color normalColor = Colors.black54;
//   bool isArabic = false;
//   String currentLocale = '';
//   Locale locale = const Locale('en', 'US');

//   Future<void> loadSavedData() async {
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     String email = sharedPref.getString('email') ?? '';
//     String password = sharedPref.getString('password') ?? '';
//     if (email.isNotEmpty && password.isNotEmpty) {
//       try {} catch (e) {
//       } finally {}
//     }
//     if (email.isEmpty || password.isEmpty) {}
//   }

//   Future<void> signInWithShared(String email, String password) async {}

//   Future<void> selectLang(String language, context) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('user_language', language);
//     if (language == "ar") {
//       // languageCode = Locale(language).toString();
//       changeLocale(language);
//       xAlign = 1;
//       arabicColor = Colors.white;
//       englishColor = Colors.black54;
//     } else if (language == "en") {
//       // languageCode = Locale(language).toString();
//       changeLocale(language);
//       xAlign = -1;
//       englishColor = Colors.white;
//       arabicColor = Colors.black54;
//     }
//   }

//   void changeLocale(String langCode) {
//     Get.updateLocale(locale);
//   }

//   void toggleCheckbox() {
//     isChecked = !isChecked;
//   }

//   Future<void> signIn(context) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     try {
//       if (isChecked) {
//         prefs.setString('email', loginEmailController.value.text.trim());
//         prefs.setString('password', loginPassController.value.text.trim());
//       } else if (!isChecked) {
//         prefs.remove('email');
//         prefs.remove('password');
//       }
//       Navigator.pushNamed(context, '/second');
//     } catch (e) {
//     } finally {}
//   }

//   LoginProvider() {
//     setAlignment();
//     englishColor = selectedColor;
//     arabicColor = normalColor;
//   }

//   setAlignment() {
//     currentLocale = Intl.getCurrentLocale();
//     if (currentLocale == 'ar') {
//       xAlign = signInAlign;
//       isArabic = true;
//     } else if (currentLocale == 'en') {
//       xAlign = loginAlign;
//       isArabic = false;
//     }
//   }

//   Future<String> getUserLang() async {
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     return sharedPref.getString('user_language') ?? 'en';
//   }

//   void showRegister() {
//     registerIsExtended = true;
//   }

//   void hideRegister() {
//     registerIsExtended = false;
//   }

//   void changePassword() async {
//     if (newPasswordController.text == confirmPasswordController.text) {}
//   }

//   Future<void> authenticateWithBiometrics(BuildContext context) async {
//     bool authenticated = false;
//     try {
//       authenticated = await auth.authenticate(
//         localizedReason: 'اضغط زر البصمه',
//         options: const AuthenticationOptions(
//           stickyAuth: true,
//           biometricOnly: true,
//         ),
//       );

//       // if (authenticated) {
//       //   WidgetsFlutterBinding.ensureInitialized();
//       //   Navigator.pushReplacement(
//       //     context,
//       //     MaterialPageRoute(builder: (context) => const NavigateBarView()),
//       //   );
//       // } else {
//       //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//       //   prefs.remove('password');
//       // }
//     } on PlatformException {
//       firstTime = false;
//       return;
//     }
//   }
// }
