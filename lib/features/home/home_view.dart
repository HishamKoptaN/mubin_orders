import 'package:flutter/material.dart';
import '../add_order/views/add_order_view.dart';
import '../drawer/my_drawer.dart';
import '../orders/present/views/orders_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  HomeView({
    super.key,
  });
  static const String routeName = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const OrdersView(),
    const AddOrderView(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
       appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.home_title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        
        //  curve: Curves.slowMiddle,
        // backgroundColor: Colors.transparent,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
              color: Colors.black,
            ),
            label: t.home_title,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: 40,
              color: Colors.black,
            ),
            backgroundColor: Colors.green,
            label: t.add_order,
          ),
        ],
      ),
    );
  }
}
