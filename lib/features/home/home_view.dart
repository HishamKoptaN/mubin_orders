import 'package:mubin_orders/core/all_imports.dart';
import '../../test.dart';
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
         TbibFileUploaderView(title: '',)
,


  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final List<String> _titles = [
     t.home_title, 
   t.add_order, 
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
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
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
            ),    BottomNavigationBarItem(
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
      ),
    );
  }
}
