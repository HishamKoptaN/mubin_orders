import 'package:get/get.dart';
import 'add_data/views/admin_products.view.dart';
import 'branches_home/home_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/add', page: () => const AdminProductsView()),
    GetPage(name: '/home', page: () => HomeView()),
  ];
}
