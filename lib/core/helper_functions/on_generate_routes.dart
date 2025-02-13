import 'package:flutter/material.dart';
import '../../features/auth/login/present/views/sign_in_view.dart';
import '../../features/main/present/view/mobile_layout.dart';
import '../../features/main/present/view/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case MobileLayout.routeName:
      return MaterialPageRoute(builder: (context) => const MobileLayout());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("حدث خطأ, لا يمكن العثور على الصفحة المطلوبة"),
          ),
        ),
      );
  }
}
