import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/student_list.dart';
import '../core/student.dart';
import '../db/students.dart';
import '../global/util.dart';

class HomeController extends GetxController {
  final TextEditingController palaceController = TextEditingController();
  late File? _videoFile;
  final RxString imagePath = "".obs;
  final RxString course = "".obs;

  void defaultDial() {
    Get.defaultDialog(
      title: "المكان",
      backgroundColor: Colors.green,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      content: SizedBox(
        width: 250,
        height: 100,
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: TextField(
                controller: palaceController,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    'الغاء',
                    style: TextStyle(
                        color: Color.fromARGB(255, 154, 22, 13), fontSize: 25),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    palaceController.text == ''
                        ? addPalaceSnackBar('ادخل المكان')
                        : recordVideo();
                  },
                  child: const Text(
                    'تأكيد',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void addPalaceSnackBar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.up,
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> recordVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      _videoFile = File(pickedFile.path);
      update();
    }
    addorder(pickedFile!.path, '', '');
  }

  Future<void> addorder(String name, String course, String imagePath) async {
    name = name.trim();
    _clearImageCache();
    Student student = Student(palaceController.text, name, name);
    student.id = await StudentDatabase.instance.addStudent(student);
    Get.find<StudentListController>().addStudent(student);
    Get.back();
    showSuccess(student.name);
  }

  void _clearImageCache() {
    if (imagePath.isEmpty) return;
    File(imagePath.value).parent.delete(recursive: true);
    imagePath.value = "";
  }

  void showSuccess(String name) {
    showCustomDialog(
      "Success",
      "$name added successfully!",
      [
        TextButton(
          onPressed: () {
            // Clear inputs
            _clearInputs();
            // Close this dialog
            Get.back();
          },
          child: const Text("غلق"),
        ),
        // TextButton(
        //     onPressed: () {
        //       // Close this dialog
        //       Get.back();
        //       // Close current page
        //       Get.back();
        //     },
        //     child: const Text(""))
      ],
    );
  }

  void _clearInputs() {
    imagePath.value = "";
    palaceController.clear();
    course.value = "";
  }
}
