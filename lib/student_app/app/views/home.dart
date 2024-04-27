import 'package:docs_orders/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../helpers/constants.dart';
import '../controllers/student_list.dart';
import '../core/card.dart';
import '../db/orders.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    RxString searchString = "".obs;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (cnr) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              const Spacer(
                flex: 6,
              ),
              // GestureDetector(
              //   onTap: () {
              //     cnr.defaultDialog();
              //   },
              //   child: Container(
              //     height: context.screenHeight * 8,
              //     width: context.screenWidth * 45,
              //     decoration: BoxDecoration(
              //       color: Colors.green,
              //       border: Border.all(color: Colors.white),
              //     ),
              //     child: Center(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           const Icon(
              //             Icons.share_rounded,
              //             color: Colors.white,
              //             size: 30,
              //           ),
              //           MyText(
              //             fieldName: 'مشاركة الكل',
              //             fontSize: context.screenSize * sixFont,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              const Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: () {
                  cnr.defaultDialog();
                },
                child: Container(
                  height: context.screenHeight * 8,
                  width: context.screenWidth * 45,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.videocam_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                        MyText(
                            fieldName: 'اضافة فيديو',
                            fontSize: context.screenSize * sixFont,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (cnr) {
                return FutureBuilder(
                  future:
                      OrderDatabase.instance.getStudents(searchString.value),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Get.find<StudentListController>()
                          .setStudents(snapshot.data!);
                      return Obx(
                        () => Get.find<StudentListController>().count > 0
                            ? StaggeredGridView.countBuilder(
                                crossAxisCount: 1,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    Get.find<StudentListController>().count,
                                itemBuilder: (context, index) {
                                  return StudentCard(
                                    student: Get.find<StudentListController>()
                                        .at(index),
                                    onDelete: (student) {
                                      cnr.showDeleteConfirmation(student);
                                    },
                                    controller: cnr,
                                  );
                                },
                                staggeredTileBuilder: (int index) =>
                                    const StaggeredTile.fit(1),
                              )
                            : const SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text("No vedios found"),
                                ),
                              ),
                      );
                    }
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.fieldName,
    required this.fontSize,
    required this.color,
  });

  final double fontSize;
  final String fieldName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      fieldName,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
    );
  }
}
