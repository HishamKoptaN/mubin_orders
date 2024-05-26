import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/add_data/provider/admin_products.controller.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_cnr.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'app/home/home_controller.dart';
import 'app/login/login_view.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global/responsive.dart';

final homeController = HomeProvider();
String languageCode = 'en';
List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  languageCode = sharedPref.getString('user_language') ?? 'en';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.windows,
  );
  cameras = await availableCameras();
  runApp(const MyApp());
}

Future<void> loadSavedData() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  String email = sharedPref.getString('email') ?? '';
  String password = sharedPref.getString('password') ?? '';
  if (email.isNotEmpty && password.isNotEmpty) {
    await signIn(email, password);
  }
}

double setWidth(context, double value) {
  return Res.isMobile(context) ? value : value / 2;
}

double setFont(context, double value) {
  return Res.isMobile(context) ? value * 1.3 : value;
}

Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await homeController.getCurrentUser();
    Get.offAll(() => const NavigateBarScreen());
  } on FirebaseAuthException catch (e) {
    debugPrint('Error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(languageCode),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => AdminProductsProvider()),
          ChangeNotifierProvider(create: (_) => NavigatorBottomBarCnr()),
        ],
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              loadSavedData();
            }
            return snapshot.hasData
                ? const NavigateBarScreen()
                : const LoginView();
          },
        ),
      ),
    );
  }
}
