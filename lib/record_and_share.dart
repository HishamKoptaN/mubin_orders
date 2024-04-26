import 'dart:io';
import 'package:docs_orders/helpers/constants.dart';
import 'package:docs_orders/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'student_app/app/controllers/student_list.dart';
import 'student_app/app/core/order.dart';
import 'student_app/app/db/orders.dart';
import 'student_app/app/global/util.dart';
import 'student_app/app/global/values.dart';

class MyAppTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoRecorderPage(),
    );
  }
}

class VideoRecorderPage extends StatefulWidget {
  @override
  _VideoRecorderPageState createState() => _VideoRecorderPageState();
}

class _VideoRecorderPageState extends State<VideoRecorderPage> {
  late File? _videoFile;
  final RxString imagePath = "".obs;
  final RxString course = "".obs;
  final TextEditingController palaceController = TextEditingController();
  bool showPalaceDialoge = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          defaultDial();
        }
        //  _recordVideo
        ,
        child: const Text('Record Video'),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[

      //       const SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: _shareVideo,
      //         child: const Text('Share Video'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void defaultDial() {
    Get.defaultDialog(
      title: "المكان",
      backgroundColor: Colors.green,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      content: SizedBox(
        width: context.screenWidth * 75,
        height: context.screenHeight * 20,
        child: Column(
          children: [
            const Spacer(),
            TextField(
              autofocus: true,
              controller: palaceController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on),
                filled: Get.theme.brightness == Brightness.dark,
                border: Get.theme.brightness == Brightness.dark
                    ? null
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                            width: 1),
                      ),
                label: const Text(
                  "المكان",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'الغاء',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: context.screenSize * sixFont),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    palaceController.text == ''
                        ? addPalaceSnackBar('ادخل المكان')
                        : recordVideo();
                  },
                  child: Text(
                    'تأكيد',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: context.screenSize * sixFont),
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
      setState(
        () {
          _videoFile = File(pickedFile.path);
        },
      );
    }
    // addorder(pickedFile!.path, '', '');
  }

  Future<void> _shareVideo() async {
    if (_videoFile != null && _videoFile!.existsSync()) {
      await Share.shareFiles([_videoFile!.path], text: 'Check out this video!');
    } else {
      print('Video file does not exist!');
    }
  }

  Future<void> addorder(String place, String video, String firstImage,
      String secondImage, double latitude, double longitude) async {
    try {
      place = place.trim();
      _clearImageCache();
      Order student = Order(
        id: 4,
        place: place,
        video: video,
        firstImage: firstImage,
        secondImage: secondImage,
        latitude: latitude,
        longitude: longitude,
      );
      student.id = await OrderDatabase.instance.addOrder(student);
      Get.find<StudentListController>().addStudent(student);
      Get.back();
      showSuccess(student.firstImage);
    } catch (e) {
      print(e);
    }
  }

  void _clearImageCache() {
    if (imagePath.isEmpty) return;
    File(imagePath.value).parent.delete(recursive: true);
    imagePath.value = "";
  }

  Future<String?> moveImage(File image) async {
    // Get the app's directory
    final Directory? directory = Values.appDirectory;
    // Get the image's name
    final String tempImageName = image.path.split("/").last;
    // Get extension filename
    final String ext = tempImageName.split(".").last;
    // Create new image name
    final String imageName =
        "video_${DateTime.now().millisecondsSinceEpoch}.$ext";
    // Final image path
    final String destination = "${directory!.path}/$imageName";

    // Compress image and copy the image to the app's directory with image_timestamp.ext
    await compressImageAndCopy(image, destination);

    // Remove the image from cache
    _clearImageCache();
    // Return the path
    print(destination);
    return imageName;
  }

  void _clearInputs() {
    imagePath.value = "";
    palaceController.clear();
    course.value = "";
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
          child: const Text("Close"),
        ),
        TextButton(
            onPressed: () {
              // Close this dialog
              Get.back();
              // Close current page
              Get.back();
            },
            child: const Text("Go to home"))
      ],
    );
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void showOverlay(String message) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(32),
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 16),
              Text(message)
            ],
          ),
        ),
      ),
    );
  }
}
