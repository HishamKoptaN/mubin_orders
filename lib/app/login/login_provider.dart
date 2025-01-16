import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../admin_navigator_bottom_bar/navigator_bottom_bar_view.dart';
import '../home/home_controller.dart';
import 'login_view.dart';
import 'package:intl/intl.dart';

final LocalAuthentication auth = LocalAuthentication();

class LoginProvider extends ChangeNotifier {
  final homeController = HomeProvider();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPassController = TextEditingController();
  bool isChecked = false;
  double width = 300.0;
  double height = 60.0;
  double xAlign = -1;
  Color englishColor = Colors.white;
  Color arabicColor = Colors.black54;
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
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
  int toggleValue = 0;
  String selectedLanguage = 'en';
  double loginAlign = -1;
  double signInAlign = 1;
  Color selectedColor = Colors.white;
  Color normalColor = Colors.black54;
  bool isArabic = false;
  String currentLocale = '';
  Locale locale = const Locale('en', 'US');

  Future<void> loadSavedData() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String email = sharedPref.getString('email') ?? '';
    String password = sharedPref.getString('password') ?? '';
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        await homeController.getCurrentUser();
      } catch (e) {
      } finally {}
    }
    if (email.isEmpty || password.isEmpty) {}
  }

  Future<void> signInWithShared(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> selectLang(String language, context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_language', language);
    if (language == "ar") {
      languageCode = Locale(language).toString();
      changeLocale(language);
      xAlign = 1;
      arabicColor = Colors.white;
      englishColor = Colors.black54;
      notifyListeners();
    } else if (language == "en") {
      languageCode = Locale(language).toString();
      changeLocale(language);
      xAlign = -1;
      englishColor = Colors.white;
      arabicColor = Colors.black54;
      notifyListeners();
    }
    notifyListeners();
  }

  void changeLocale(String langCode) {
    Get.updateLocale(locale);
    notifyListeners();
  }

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  Future<void> signIn(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmailController.value.text.trim(),
        password: loginPassController.value.text.trim(),
      );
      if (isChecked) {
        prefs.setString('email', loginEmailController.value.text.trim());
        prefs.setString('password', loginPassController.value.text.trim());
      } else if (!isChecked) {
        prefs.remove('email');
        prefs.remove('password');
      }
      Navigator.pushNamed(context, '/second');
    } catch (e) {
    } finally {}
  }

  LoginProvider() {
    setAlignment();
    englishColor = selectedColor;
    arabicColor = normalColor;
    notifyListeners();
  }

  setAlignment() {
    currentLocale = Intl.getCurrentLocale();
    if (currentLocale == 'ar') {
      xAlign = signInAlign;
      isArabic = true;
      notifyListeners();
    } else if (currentLocale == 'en') {
      xAlign = loginAlign;
      isArabic = false;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<String> getUserLang() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString('user_language') ?? 'en';
  }

  void showRegister() {
    registerIsExtended = true;
    notifyListeners();
  }

  void hideRegister() {
    registerIsExtended = false;
    notifyListeners();
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

  Future<void> authenticateWithBiometrics(BuildContext context) async {
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavigateBarScreen()),
        );
      } else {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('password');
      }
    } on PlatformException {
      firstTime = false;
      return;
    }
  }

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  Future<void> clearCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    notifyListeners();
  }
}
