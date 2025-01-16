<<<<<<< HEAD
// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mbean_admin/helpers/media_query.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../helpers/constants.dart';
import '../../generated/l10n.dart';
import '../../helpers/strings.dart';
import '../../test._two.dart';
import 'navigator_bottom_bar_cnr.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class NavigateBarScreen extends StatefulWidget {
  const NavigateBarScreen({super.key});
  @override
  State<NavigateBarScreen> createState() => _HomePageState();
}

class _HomePageState extends State<NavigateBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NavigatorBottomBarCnr>(
        init: NavigatorBottomBarCnr(),
        builder: (cnr) {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                child: IconButton(
                  onPressed: () {
                    cnr.logOut();
                  },
                  icon: const Icon(Icons.logout),
                  iconSize: context.screenSize * 0.10,
                ),
              ),
              centerTitle: true,
              title: Text(
                S.of(context).home_title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: context.screenSize * sevenFont,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Text(
              //   cnr.title,
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: context.screenSize * sevenFont,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            body: SizedBox(
              child: cnr.pages[cnr.currentAdminPagesIndex],
            ),
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SalomonBottomBar(
                  curve: Curves.slowMiddle,
                  currentIndex: cnr.currentAdminPagesIndex,
                  backgroundColor: Colors.white60,
                  onTap: (int index) async {
                    cnr.setCurrentAdminIndex(index);
=======
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../generated/l10n.dart';
import '../drawer/my_drawer.dart';
import '../global_methods/global_methods.dart';
import '../home/home_controller.dart';
import 'navigator_bottom_bar_cnr.dart';

class NavigateBarScreen extends StatelessWidget {
  const NavigateBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    homeController.getCurrentUser();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Consumer<NavigatorBottomBarCnr>(
            builder: (context, cnr, child) {
              return Text(
                cnr.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.76,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Consumer<NavigatorBottomBarCnr>(
                builder: (context, cnr, child) {
                  return cnr.pages[cnr.currentIndex];
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Consumer<NavigatorBottomBarCnr>(
              builder: (context, cnr, child) {
                return SalomonBottomBar(
                  curve: Curves.slowMiddle,
                  currentIndex: cnr.currentIndex,
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                  onTap: (int index) async {
                    cnr.setCurrentIndex(index, context);
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
                  },
                  items: [
                    SalomonBottomBarItem(
                      selectedColor: Colors.green,
                      unselectedColor: Colors.grey,
                      icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
<<<<<<< HEAD
                            colors: [Colors.black, Colors.black],
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.add,
                          size: context.screenSize * 0.13,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "اضافة طلب",
                        style:
                            TextStyle(fontSize: context.screenSize * threeFont),
                      ),
                    ),
                    SalomonBottomBarItem(
                      selectedColor: Colors.green,
                      unselectedColor: Colors.grey,
                      icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
=======
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
                            colors: [
                              Colors.black,
                              Colors.black,
                            ],
                          ).createShader(bounds);
                        },
<<<<<<< HEAD
                        child: Icon(
                          Icons.home,
                          size: context.screenSize * 0.10,
=======
                        child: const Icon(
                          Icons.home,
                          size: 40,
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
<<<<<<< HEAD
                        "الرئيسيه",
                        style:
                            TextStyle(fontSize: context.screenSize * threeFont),
=======
                        S.of(context).home_title,
                        style: TextStyle(
                          fontSize: setFont(context, 12),
                        ),
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
                      ),
                    ),
                    SalomonBottomBarItem(
                      selectedColor: Colors.green,
                      unselectedColor: Colors.grey,
                      icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.black],
                          ).createShader(bounds);
                        },
<<<<<<< HEAD
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          size: context.screenSize * 0.10,
=======
                        child: const Icon(
                          Icons.add_circle,
                          size: 40,
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
<<<<<<< HEAD
                        "سلة الطلبات",
                        style:
                            TextStyle(fontSize: context.screenSize * threeFont),
                      ),
                    ),
                    SalomonBottomBarItem(
                      selectedColor: Colors.green,
                      unselectedColor: Colors.grey,
                      icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.black],
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.category_rounded,
                          size: context.screenSize * 0.10,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "الفئات",
                        style:
                            TextStyle(fontSize: context.screenSize * threeFont),
                      ),
                    ),
                  ],
                )),
          );
        },
=======
                        S.of(context).add_order,
                        style: TextStyle(
                          fontSize: setFont(context, 12),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
      ),
    );
  }
}
