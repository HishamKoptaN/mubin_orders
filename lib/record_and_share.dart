import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import 'student_app/app/controllers/student_list.dart';
import 'student_app/app/core/student.dart';
import 'student_app/app/db/students.dart';
import 'student_app/app/global/util.dart';
import 'student_app/app/global/values.dart';

class MyAppTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Recorder & Share',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  final TextEditingController _nameController = TextEditingController();
  final RxString course = "".obs;

  Future<void> _recordVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(
        () {
          _videoFile = File(pickedFile.path);
        },
      );
    }
    addStudent(pickedFile!.path, '', '');
  }

  Future<void> _shareVideo() async {
    if (_videoFile != null && _videoFile!.existsSync()) {
      await Share.shareFiles([_videoFile!.path], text: 'Check out this video!');
    } else {
      print('Video file does not exist!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Recorder & Share'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _recordVideo,
              child: const Text('Record Video'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _shareVideo,
              child: const Text('Share Video'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addStudent(String name, String course, String imagePath) async {
    name = name.trim();

    // showOverlay("Adding student...");
    // Convert image to File
    final File temp = File(imagePath);
    // Move the image to the app's directory and get new name
    // String? imgpath = await moveImage(temp);
    // If path is null, just return
    // if (imgpath == null) return;
    // Clear image cache
    _clearImageCache();
    // Create a student
    Student student = Student(name, name, name);
    // Add student to database
    student.id = await StudentDatabase.instance.addStudent(student);
    // Add student to list
    Get.find<StudentListController>().addStudent(student);
    // Hide overlay loading
    Get.back();
    // Show success dialog
    showSuccess(student.name);
  }

  void _clearImageCache() {
    // If image path is empty, just return
    if (imagePath.isEmpty) return;
    // Delete the image and its directory
    File(imagePath.value).parent.delete(recursive: true);
    // Clear image path
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
    _nameController.clear();
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
