import 'dart:io';
import 'package:docs_orders/helpers/media_query.dart';
import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../../helpers/constants.dart';
import '../controllers/student_list.dart';
import '../core/card.dart';
import '../core/student.dart';
import '../db/students.dart';
import '../global/util.dart';
import '../global/values.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    RxString searchString = "".obs;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (cnr) {
        return Scaffold(
          floatingActionButton: GestureDetector(
            onTap: () {
              cnr.defaultDial();
            },
            child: Container(
              height: context.screenHeight * 8,
              width: context.screenWidth * 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 137, 11),
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    MyText(
                      fieldName: 'اضافة فيديو',
                      fontSize: context.screenSize * sixFont,
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            actions: [
              const Spacer(
                flex: 4,
              ),
              MyText(
                fontSize: context.screenSize * eightFont,
                fieldName: 'الرئيسيه',
              ),
              const Spacer(),
              Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Icon(Icons.dark_mode_rounded);
                    }
                    return const Icon(Icons.sunny);
                  },
                ),
                onChanged: (val) async {
                  // Change theme
                  Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
                  // Update darkmode in database
                  StudentDatabase.instance.updateDarkmode(val);
                },
              ),

              const Spacer(),
              // IconButton(
              //   tooltip: "Add student",
              //   icon: const Icon(Icons.add),
              //   onPressed: () {
              //     Get.to(() => AddStudentPage());
              //   },
              // )
            ],
          ),
          body: SingleChildScrollView(
            child: Flex(
              direction: Axis.vertical,
              children: [
                // Search bar
                // StudentSearchBar(
                //   onSearch: (query) {
                //     searchString.value = query;
                //   },
                // ),
                // List of students
                Obx(
                  () => FutureBuilder(
                    future: StudentDatabase.instance
                        .getStudents(searchString.value),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // Set students to controller
                        Get.find<StudentListController>()
                            .setStudents(snapshot.data!);
                        // Otherwise, return list of students
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Obx(
                            () => Get.find<StudentListController>().count > 0
                                ? StaggeredGridView.countBuilder(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 16,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        Get.find<StudentListController>().count,
                                    itemBuilder: (context, index) {
                                      // Return student card
                                      return StudentCard(
                                        student:
                                            Get.find<StudentListController>()
                                                .at(index),
                                        onDelete: (student) {
                                          showDeleteConfirmation(student);
                                        },
                                      );
                                    },
                                    staggeredTileBuilder: (int index) =>
                                        const StaggeredTile.fit(1))
                                : const SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text("No vedios found"),
                                    ),
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Show a dialog to confirm the deletion of a student
  void showDeleteConfirmation(Student student) {
    showCustomDialog(
      "مسح فيديو",
      "هل انت متأكد من مسح الفيديو?",
      [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("الغاء"),
        ),
        TextButton(
          onPressed: () async {
            // Close dialog
            Get.back();

            // Check if student has an id
            if (student.id == null) {
              showDeleteError();
              return;
            }

            // Delete student from database
            await StudentDatabase.instance.deleteStudent(student);
            // Delete student from list
            Get.find<StudentListController>().deleteStudent(student);
            // Delete student image
            await File("${Values.appDirectory!.path}/${student.image}")
                .delete();
          },
          child: const Text("مسح"),
        ),
      ],
    );
  }

  /// Show an error dialog when an error occured during deleting a student
  void showDeleteError() {
    showCustomDialog(
      "خطأ",
      'حدث خطأ اثناء مسح الفيديو',
      [
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Get.theme.colorScheme.onErrorContainer),
          onPressed: () {
            Get.back();
          },
          child: const Text("اوك"),
        ),
      ],
    );
  }
}

class StudentSearchBar extends StatelessWidget {
  const StudentSearchBar({required this.onSearch, super.key});

  final Function onSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: PressableDough(
        child: TextField(
          autofocus: false,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: Get.theme.brightness == Brightness.dark,
              border: Get.theme.brightness == Brightness.dark
                  ? null
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1),
                    ),
              label: const Text("Search student")),
          onChanged: (val) {
            onSearch(val);
          },
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.fieldName,
    required this.fontSize,
  });

  final double fontSize;
  final String fieldName;
  @override
  Widget build(BuildContext context) {
    return Text(
      fieldName,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
