import 'package:mubin_orders/core/all_imports.dart';
import '../orders/present/views/add_order_view.dart';
import '../drawer/my_drawer.dart';
import '../orders/present/views/orders_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });
  static const String routeName = "HomeView";
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 1;
  final List<Widget> _pages = [
    const OrdersView(),
    const AddOrderView(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final List<String> _titles = [
      t.home_title,
      t.add_order,
    ];
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey, 
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30.sp,
                  color: Colors.black,
                ),
                label: t.home_title,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  size: 30.sp,
                  color: Colors.black,
                ),
                backgroundColor: Colors.green,
                label: t.add_order,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
