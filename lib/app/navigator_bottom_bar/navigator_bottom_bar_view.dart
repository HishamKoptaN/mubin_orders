// ignore_for_file: unused_import
import 'package:docs_orders/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../helpers/constants.dart';
import '../../temporary/save_video.dart';
import 'navigator_bottom_bar_cnr.dart';

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
            resizeToAvoidBottomInset: true,
            body: SizedBox(child: cnr.pages[cnr.currentIndex]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SalomonBottomBar(
                curve: Curves.slowMiddle,
                currentIndex: cnr.currentIndex,
                backgroundColor: Colors.white60,
                onTap: (int index) async {
                  cnr.setCurrentIndex(index);
                },
                items: [
                  // SalomonBottomBarItem(
                  //   selectedColor: Colors.green,
                  //   unselectedColor: Colors.grey,
                  //   icon: ShaderMask(
                  //     shaderCallback: (Rect bounds) {
                  //       return const LinearGradient(
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter,
                  //         colors: [Colors.black, Colors.black],
                  //       ).createShader(bounds);
                  //     },
                  //     child: Icon(
                  //       Icons.favorite,
                  //       size: context.screenSize * 0.10,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   title: Text(
                  //     "المفضله",
                  //     style:
                  //         TextStyle(fontSize: context.screenSize * threeFont),
                  //   ),
                  // ),
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
                        Icons.shopping_cart_rounded,
                        size: context.screenSize * 0.10,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
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
                  SalomonBottomBarItem(
                    selectedColor: Colors.green,
                    unselectedColor: Colors.grey,
                    icon: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                          ],
                        ).createShader(bounds);
                      },
                      child: Icon(
                        Icons.home,
                        size: context.screenSize * 0.10,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "الرئيسيه",
                      style:
                          TextStyle(fontSize: context.screenSize * threeFont),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
