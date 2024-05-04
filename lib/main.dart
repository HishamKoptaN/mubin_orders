import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_talabat/app/login/login_view.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

String languageCode = 'en';
List<CameraDescription> cameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } on CameraException catch (e) {
    if (kDebugMode) {
      print(e.code);
    }
  }
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  languageCode = sharedPref.getString('user_language') ?? 'en';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(const MyApp());
}

Future<void> loadSavedData() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  String email = sharedPref.getString('email') ?? '';
  String password = sharedPref.getString('password') ?? '';
  if (email != '' && password != '') {
    signIn(
      email,
      password,
    );
  }
}

Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    Get.to(NavigateBarScreen());
  } on FirebaseAuthException {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        locale: Locale(languageCode),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeListResolutionCallback: (currentLang, supportLang) {},
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            loadSavedData();
            return snapshot.hasData ? NavigateBarScreen() : const LoginView();
          },
        ),
      ),
    );
  }
}

class LanguageManager {
  static const String _prefKey = 'userLanguage';
  static Future<void> saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, languageCode);
  }

  static Future<String?> getSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_prefKey);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _selectedLanguage;
  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    String? savedLanguage = await LanguageManager.getSavedLanguage();
    if (savedLanguage != null) {
      setState(() {
        _selectedLanguage = savedLanguage;
      });
    } else {
      // Set default language
      _selectedLanguage = 'en'; // English
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Language:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(child: Text('العربية'), value: 'ar'),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
                LanguageManager.saveLanguage(value!);
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Selected Language: $_selectedLanguage',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
