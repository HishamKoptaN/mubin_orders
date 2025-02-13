import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/database/cache/shared_pref_helper.dart';
import 'core/database/cache/shared_pref_keys.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'features/main/present/view/main_view.dart';
import 'generated/l10n.dart';
import 'core/helper/app_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  Bloc.observer = AppBlocObserver();
  await Injection.inject();
  await ScreenUtil.ensureScreenSize();
  String locale = await SharedPrefHelper.getString(
        key: SharedPrefKeys.languageCode,
      ) ??
      'ar';
  Bloc.observer = AppBlocObserver();
  if (SharedPrefHelper.getBool(key: "fingerprints") == null) {
    SharedPrefHelper.setData(
      key: "fingerprints",
      value: false,
    );
  }
  runApp(
    MyApp(
      locale: null,
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
  Widget build(context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mubin',
          color: Colors.white,
          theme: ThemeData(
            primaryColor: Colors.amber,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.amber,
            ),
            fontFamily: "Arial",
            useMaterial3: true,
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(
            locale ?? 'ar',
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: MainView.routeName,
        ),
      ),
    );
  }
}
