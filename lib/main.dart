import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'app/home/home_controller.dart';
import 'app/home/home_view.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/responsive.dart';
import 'package:provider/provider.dart';

String languageCode = 'en';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  languageCode = sharedPref.getString('user_language') ?? 'en';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.windows,
  );
  final displayVideoCOntrollerContrller = Get.put(HomeProvider());
  displayVideoCOntrollerContrller.setCurrentIndex(0);
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

    Get.to(NavigateBarScreen());
  } on FirebaseAuthException {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
        child: MaterialApp(
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
              // loadSavedData();
              return snapshot.hasData ? HomeView() : HomeView();
            },
          ),
        ),
      ),
    );
  }
}
