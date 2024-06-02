import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/add_data/provider/admin_products.controller.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_cnr.dart';
import 'app/admin_navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'app/home/home_controller.dart';
import 'app/login/login_provider.dart';
import 'app/login/login_view.dart';
import 'app/video_player.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

final homeProvider = HomeProvider();
final loginProvider = HomeProvider();

String? languageCode;
List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  languageCode = sharedPref.getString('user_language') ?? 'ar';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.windows,
  );
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => NavigatorBottomBarCnr()),
        ChangeNotifierProvider(create: (_) => AdminProductsProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        locale: Locale(languageCode!),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: '/',
        routes: {
          '/': (context) => StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? const NavigateBarScreen()
                      : LoginView();
                },
              ),
          '/login': (context) => LoginView(),
          '/navigate': (context) => const NavigateBarScreen(),
        },
      ),
    );
  }
}
