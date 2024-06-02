import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_talabat/global/media_query.dart';
import 'package:mbean_talabat/main.dart';
import '../../generated/l10n.dart';
import '../global_methods/global_methods.dart';
import 'my_drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.screenWidth * 70,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: context.screenHeight * 70,
        child: SingleChildScrollView(
          child: GetBuilder<MyDrawerController>(
            init: MyDrawerController(),
            builder: (cnr) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: context.screenHeight * 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      cnr.logOut();
                    },
                    child: Row(
                      mainAxisAlignment: cnr.isArabic
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Directionality(
                          textDirection: cnr.isArabic
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: Icon(
                            Icons.logout,
                            size: context.screenSize * 0.13,
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          S.of(context).log_out,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: setFont(context, 17.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(
                          flex: 6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.screenHeight * 5,
                  ),
                  // Container(
                  //   width: cnr.width,
                  //   height: cnr.height,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.grey,
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(50.0),
                  //     ),
                  //   ),
                  //   child: Stack(
                  //     children: [
                  //       AnimatedAlign(
                  //         alignment: Alignment(cnr.xAlign, 0),
                  //         duration: const Duration(milliseconds: 300),
                  //         child: Container(
                  //           width: cnr.width * 0.5,
                  //           height: cnr.height,
                  //           decoration: const BoxDecoration(
                  //             color: Colors.lightGreen,
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(50.0),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () async {
                  //           await cnr.selectEn();
                  //         },
                  //         child: Align(
                  //           alignment: const Alignment(-1, 0),
                  //           child: Container(
                  //             width: cnr.width * 0.5,
                  //             color: Colors.transparent,
                  //             alignment: Alignment.center,
                  //             child: Text(
                  //               'English',
                  //               style: TextStyle(
                  //                 color: cnr.loginColor,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () async {
                  //           await cnr.selectAr();
                  //         },
                  //         child: Align(
                  //           alignment: const Alignment(1, 0),
                  //           child: Container(
                  //             width: cnr.width * 0.5,
                  //             color: Colors.transparent,
                  //             alignment: Alignment.center,
                  //             child: Text(
                  //               'عربي',
                  //               style: TextStyle(
                  //                 color: cnr.signInColor,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  IconData? icon;
  final String text;
  final void Function()? onTap;

  MyListTile({super.key, this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: onTap,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
