import 'package:mubin_orders/core/all_imports.dart';
import '../../l10n/app_localizations.dart';
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
  int _currentIndex = 0;
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
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
              backgroundColor: Colors.white,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 28.sp),
                  label: t.home_title,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle, size: 28.sp),
                  label: t.add_order,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
