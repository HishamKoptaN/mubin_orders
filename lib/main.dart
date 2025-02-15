import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_observer.dart';
import 'core/database/cache/shared_pref_helper.dart';
import 'core/database/cache/shared_pref_keys.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'features/main/present/view/main_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                              value:  '1|QIrLW9H4AkJ2tCO3eEcvu57QDwkA38fTx2OOhMQ076298fb1',
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
//  items: [
//               SideMenuItem(
//                 title: t.kinia_name,
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "KE",
//                 
//                 ),
//               ),
//               SideMenuItem(
//                 title: t.tanzania,
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "TZ",
//                 
//                 ),
//               ),
//               SideMenuItem(
//                 title: "malawi",
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "MW",
//                 
//                 ),
//               ),
//               SideMenuItem(
//                 title: "cameroun",
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "CM",
//                 
//                 ),
//               ),
//               SideMenuItem(
//                 title: "benin",
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "BJ",
//                 ),
//               ),
//               SideMenuItem(
//                 title: "ghana",
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "GA",
//                 ),
//               ),
//               SideMenuItem(
//                 title: "guinee",
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "GN",
//                 ),
//                 badgeContent: const Text(
//                   '3',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SideMenuItem(
//                 title: "uganda",
//                 iconWidget: CountryFlag.fromCountryCode(
//                   "UG",
//                 ),
//               