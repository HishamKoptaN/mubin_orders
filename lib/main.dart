import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/database/cache/shared_pref_helper.dart';
import 'core/database/cache/shared_pref_keys.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'features/main/present/view/main_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Injection.inject();
  await ScreenUtil.ensureScreenSize();
  String locale = await SharedPrefHelper.getString(
        key: SharedPrefKeys.languageCode,
      ) ??
      'ar';
  // Bloc.observer = AppBlocObserver();
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
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(
        locale ?? '',
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: MainView.routeName,
    );
  }
}
