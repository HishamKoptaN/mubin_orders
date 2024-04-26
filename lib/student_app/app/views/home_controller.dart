import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../test_eight.dart';
import '../controllers/student_list.dart';
import '../core/order.dart';
import '../db/orders.dart';
import 'package:location/location.dart' as loc;
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';

class HomeController extends GetxController {
  final TextEditingController palaceController = TextEditingController();
  final loc.Location location = loc.Location();
  late VideoPlayerController? fileController;

//  Get.find<StudentListController>().at(index),
  double latitude = 0;
  double longitude = 0;
  // LatLng latitude = LatLng(latitude, longitude)
  late File? videoFile;
  late File? imageFile;
  final RxString imagePath = "".obs;
  final RxString course = "".obs;
  void defaultDialog() {
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
                  onTap: () async {
                    palaceController.text == ''
                        ? addPalaceSnackBar('ادخل المكان')
                        : {
                            Get.back(),
                            recordVideo(),
                          };
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

  Future<void> shareVideo(String path) async {
    double latitude = 37.422;
    double longitude = -122.084;

    // Prepare WhatsApp message
    String message =
        "Check out my location:\nhttps://maps.google.com/?q=$latitude,$longitude";
    videoFile = File(path);
    if (videoFile != null && videoFile!.existsSync()) {
      await Share.shareFiles(
        [
          videoFile!.path,
          videoFile!.path,
        ],
        text: message,
      );
    } else {
      print('Video file does not exist!');
    }
  }

  setVedioFile(String path) async {
    final file = File(path);
    fileController = VideoPlayerController.file(file)
      ..initialize().then(
        (_) {
          fileController?.play();
        },
      );
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result == null) return null;
    return File(result.files.single.path.toString());
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

  Future<void> getCurrentLocation() async {
    try {
      final loc.LocationData locationResult = await location.getLocation();
      latitude = locationResult.latitude!;
      longitude = locationResult.longitude!;
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> recordVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      videoFile = File(pickedFile.path);
      update();
    }
    await getCurrentLocation();
    addorder(palaceController.text, pickedFile!.path, latitude, longitude);
  }

  Future<void> addorder(
      String place, String video, double latitude, double longitude) async {
    try {
      place = place.trim();
      clearImageCache();
      Order order = Order(
        place: place,
        video: video,
        firstImage: '',
        secondImage: '',
        latitude: latitude,
        longitude: longitude,
      );
      order.id = await OrderDatabase.instance.addOrder(order);
      order.latitude = latitude;
      order.longitude = longitude;
      Get.find<StudentListController>().addStudent(order);
      Get.back();
      update();
      showSuccess(order.firstImage);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void clearImageCache() {
    if (imagePath.isEmpty) return;
    File(imagePath.value).parent.delete(recursive: true);
    imagePath.value = "";
    imageFile = null;
  }

  void showSuccess(String name) {
    // showCustomDialog(
    //   "Success",
    //   "$name added successfully!",
    //   [
    //     TextButton(
    //       onPressed: () {
    //         // Clear inputs
    //         _clearInputs();
    //         // Close this dialog
    //         Get.back();
    //       },
    //       child: const Text("غلق"),
    //     ),
    //   ],
    // );
  }

  sendLocationOnWhatsApp() async {
    // Get current location
    double latitude = 37.422;
    double longitude = -122.084;
    // Prepare WhatsApp message
    String message =
        "Check out my location:\nhttps://maps.google.com/?q=$latitude,$longitude";
    // Encode message
    String url = "https://wa.me/?text=${Uri.encodeFull(message)}";

    // Launch WhatsApp
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void clearInputs() {
    imagePath.value = "";
    palaceController.clear();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }

  Future<void> pickNewVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      videoFile = File(pickedFile.path);
      update();
    }
  }

  Future<void> replaceViedo(
      int? id,
      String place,
      String firstImage,
      String secondImage,
      String video,
      double latitude,
      double longitude) async {
    try {
      await pickNewVideo();
      Student updatedStudent = Student(
        id: id,
        place: place,
        firstImage: firstImage,
        secondImage: secondImage,
        video: videoFile!.path,
        latitude: latitude,
        longitude: longitude,
      );
      await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
      Get.back();
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> addFirstImage(
      int? id,
      String place,
      String firstImage,
      String secondImage,
      String video,
      double latitude,
      double longitude) async {
    try {
      await pickImage();
      Student updatedStudent = Student(
        id: id,
        place: place,
        firstImage: imageFile!.path,
        secondImage: secondImage,
        video: video,
        latitude: latitude,
        longitude: longitude,
      );
      await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> addSecondImage(
      int? id,
      String place,
      String firstImage,
      String secondImage,
      String video,
      double latitude,
      double longitude) async {
    try {
      await pickImage();
      Student updatedStudent = Student(
        id: id,
        place: place,
        firstImage: firstImage,
        secondImage: imageFile!.path,
        video: video,
        latitude: latitude,
        longitude: longitude,
      );
      await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
