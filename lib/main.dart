import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_cnr.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'app/home/home_controller.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/responsive.dart';

final homeController = HomeController();
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
  if (email != '' && password != '') {
    signIn(
      email,
      password,
    );
  }
}

double setWidth(context, double value) {
  double width;
  if (Res.isMobile(context)) {
    width = value;
    return width;
  } else {
    width = (value / 2);
    return width;
  }
}

double setFont(context, double value) {
  double font;
  if (Res.isMobile(context)) {
    font = (value * 1.3);
    return font;
  } else {
    font = (value * 1);
    return font;
  }
}

Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await homeController.getCurrentUser();
    Get.to(const NavigateBarScreen());
  } on FirebaseAuthException {}
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavigatorBottomBarCnr()),
          ChangeNotifierProvider(create: (_) => HomeController()),
        ],
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
              return snapshot.hasData
                  ? const NavigateBarScreen()
                  : const NavigateBarScreen();
            },
          ),
        ),
      ),
    );
  }
}
