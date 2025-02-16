import 'package:flutter/material.dart';
import 'package:mubin_orders/features/home/home_view.dart';
import '../../features/auth/login/present/views/sign_in_view.dart';
import '../../features/main/present/view/mobile_layout.dart';
import '../../features/main/present/view/main_view.dart';
import '../../features/orders/present/views/orders_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView()); 
      
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
       case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());
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
