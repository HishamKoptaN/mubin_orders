import 'package:firebase_core/firebase_core.dart';
import 'core/all_imports.dart';
import 'core/app_observer.dart';
import 'core/database/cache/shared_pref_helper.dart';
import 'core/database/cache/shared_pref_keys.dart'; 
import 'core/helper_functions/on_generate_routes.dart';
import 'features/main/present/view/main_view.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.signOut();
  await Injection.inject();
  await ScreenUtil.ensureScreenSize();
  String locale = await SharedPrefHelper.getString(
        key: SharedPrefKeys.languageCode,
      ) ??
      'ar';   await SharedPrefHelper.setSecuredString(
                              key: SharedPrefKeys.userToken,
                              value:  '2|tfljNqJDELKyjcB0Z1rtBXTv4edcbOWWkv5UZEsA9424f2d2',
                            );
  Bloc.observer = AppBlocObserver();
  // if (SharedPrefHelper.getBool(key: "fingerprints") == null) {
  //   SharedPrefHelper.setData(
  //     key: "fingerprints",
  //     value: false,
  //   );
  // }
  runApp(
    MyApp(
      locale: locale,
    ),
  );
}
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.locale,
  });
  String? locale;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(
          locale ?? '',
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: MainView.routeName,
      ),
    );
  }
}