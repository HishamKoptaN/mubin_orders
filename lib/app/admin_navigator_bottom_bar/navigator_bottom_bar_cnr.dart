import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../add_data/views/admin_products.view.dart';
import '../home/home_view.dart';

class NavigatorBottomBarCnr extends ChangeNotifier {
  late String _title;
  int _currentIndex = 0;
  late List<Widget> _pages;

  String get title => _title;
  int get currentIndex => _currentIndex;
  List<Widget> get pages => _pages;
  NavigatorBottomBarCnr() {
    _title = 'Home';
    _pages = [
      HomeView(),
      const AdminProductsView(),
    ];
  }

  void setCurrentIndex(int index, BuildContext context) async {
    switch (index) {
      case 0:
        _title = S.of(context).home_title;
        break;
      case 1:
        _title = S.of(context).add_order;
        break;
    }
    _currentIndex = index;
    notifyListeners();
  }
}
