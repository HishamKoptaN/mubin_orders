import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../admin_navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'login_view.dart';
import 'package:intl/intl.dart';

final LocalAuthentication auth = LocalAuthentication();

class LoginController extends GetxController {
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  late final currentUser = FirebaseAuth.instance.currentUser;
  TextEditingController registerNamelController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();
  TextEditingController registerPhoneNumberController = TextEditingController();
  TextEditingController emailPassResetController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  static const String emailKey = 'email';
  static const String passwordKey = 'password';
  User? user = FirebaseAuth.instance.currentUser;
  bool? showWhat;
  bool firstTimeLogin = true;
  bool registerIsExtended = false;
  bool loginIsExtended = false;
  bool firstTime = false;
  final RxBool isChecked = RxBool(false);
  int toggleValue = 0;
  String selectedLanguage = 'en';
  double width = 300.0;
  double height = 60.0;
  double loginAlign = -1;
  double signInAlign = 1;
  Color selectedColor = Colors.white;
  Color normalColor = Colors.black54;
  bool isArabic = false;
  var locale = const Locale('en', 'US'); // Default locale is English
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  String currentLocale = '';
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

  Future<String> getUserLang() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString('user_language') ?? 'en';
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
    update();
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
    update();
  }

  void changeLocale(String langCode) {
    locale = Locale(langCode);
    Get.updateLocale(locale);
    update();
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    update();
  }

  void showRegister() {
    registerIsExtended = true;

    update();
  }

  void hideRegister() {
    registerIsExtended = false;

    update();
  }

  void changePassword() async {
    User user = FirebaseAuth.instance.currentUser!;
    if (newPasswordController.text == confirmPasswordController.text) {
      try {
        await user.updatePassword(newPasswordController.text);
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    }
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'اضغط زر البصمه',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (authenticated) {
        WidgetsFlutterBinding.ensureInitialized();
        Get.to(const NavigateBarScreen());
      } else {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('password');
      }
    } on PlatformException {
      firstTime = false;
      return;
    }
  }

  Future<void> signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmailController.value.text.trim(),
        password: loginPassController.value.text.trim(),
      );
      if (isChecked.value) {
        prefs.setString('email', loginEmailController.value.text.trim());
        prefs.setString('password', loginPassController.value.text.trim());
      } else if (!isChecked.value) {
        prefs.remove('email');
        prefs.remove('password');
      }
      Get.to(const NavigateBarScreen());

      Get.snackbar(
        'Success',
        '',
        colorText: Colors.black,
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(15),
        icon: const Icon(
          Icons.message,
          color: Colors.black,
        ),
        messageText: const Text(
          'Success Logged in',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ), // زيادة حجم الخط هنا
        ),
      );
    } on FirebaseAuthException {
      Get.snackbar(
        'Faild',
        '',
        colorText: Colors.black,
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(15),
        icon: const Icon(
          Icons.message,
          color: Colors.black,
        ),
        messageText: const Text(
          'Try Again',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    Get.off(const LoginView());
  }

  Future<void> loadSavedData() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    loginEmailController.text = sharedPref.getString('email') ?? '';
    loginPassController.text = sharedPref.getString('password') ?? '';
  }

  Future<void> clearCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    update();
  }
}
