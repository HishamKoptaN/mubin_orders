import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_talabat/global/media_query.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../global/constants.dart';
import '../../generated/l10n.dart';
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
                cnr.title,
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
            body: SizedBox(child: cnr.pages[cnr.currentPagesIndex]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SalomonBottomBar(
                curve: Curves.slowMiddle,
                currentIndex: cnr.currentPagesIndex,
                backgroundColor: Colors.white60,
                onTap: (int index) async {
                  cnr.setCurrentIndex(index, context);
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
                      S.of(context).home_title,
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
                        Icons.add_circle,
                        size: context.screenSize * 0.10,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      S.of(context).add_order,
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
