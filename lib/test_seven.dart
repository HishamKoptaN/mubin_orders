import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'student_app/app/controllers/student_list.dart';
import 'student_app/app/core/student.dart';
import 'student_app/app/db/students.dart';
import 'student_app/app/global/util.dart';

class MyAppSeven extends StatelessWidget {
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

  Future<void> _recordVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      try {
        _saveVideoToStorage(_videoFile!);
        addStudent(
          _videoFile!.path,
          _videoFile!.path,
          _videoFile!.path,
        );
        print('Vedio Saved Successfully');
      } catch (e) {
        print(e);
      }
      setState(
        () {
          _videoFile = File(pickedFile.path);
        },
      );
    }
  }

  Future<void> _saveVideoToStorage(File videoFile) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String videoFileName = 'video_${DateTime.now().millisecondsSinceEpoch}.mp4';
    File newVideoFile = await videoFile.copy('$appDocPath/$videoFileName');
    setState(
      () {
        _videoFile = newVideoFile;
      },
    );
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
        title: Text('Video Recorder & Share'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _recordVideo,
              child: Text('Record Video'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_videoFile != null) {
                  _saveVideoToStorage(_videoFile!);
                }
              },
              child: Text('Save Video to Storage'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _shareVideo,
              child: Text('Share Video'),
            ),
          ],
        ),
      ),
    );
  }

  void addStudent(String name, String course, String imagePath) async {
    try {
      name = name.trim();
      // errorMessage.value = "";
      // errorType.value = 0;

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
      print('added to database');
    } catch (e) {
      print(e);
    }
  }

  /// Copy the image to the app's directory and return the new image name

  // Future<String?> compressVideo(File video) async {
  //   // Get the app's directory
  //   final Directory? directory = Values.appDirectory;
  //   // Get the video's name
  //   final String tempVideoName = video.path.split("/").last;
  //   // Get extension filename
  //   final String ext = tempVideoName.split(".").last;
  //   // Create new video name
  //   final String videoName =
  //       "video_${DateTime.now().millisecondsSinceEpoch}.$ext";
  //   // Final video path
  //   final String destination = "${directory!.path}/$videoName";

  //   // Compress video using FFmpeg
  //       .execute('-i ${video.path} -vf scale=640:360 ${destination}');
  //   if (rc == 0) {
  //     // Video compression successful
  //     // Remove the original video
  //     video.deleteSync();
  //     // Return the path to the compressed video
  //     return videoName;
  //   } else {
  //     // Video compression failed
  //     return null;
  //   }
  // }

  /// Clear image cache
  void _clearImageCache() {
    // // If image path is empty, just return
    // if (imagePath.isEmpty) return;
    // // Delete the image and its directory
    // File(imagePath.value).parent.delete(recursive: true);
    // // Clear image path
    // imagePath.value = "";
  }

  // Clear inputs
  void _clearInputs() {
    // imagePath.value = "";
    // _nameController.clear();
    // course.value = "";
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

  void showPickImageMessage() {
    showCustomDialog(
        "Error",
        "Please select an image first!",
        [
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Get.theme.colorScheme.onErrorContainer),
              onPressed: () {
                // Close this dialog
                Get.back();
              },
              child: const Text("Ok"))
        ],
        type: DialogType.error);
  }

  void showErrorDirectory() {
    showCustomDialog(
        "Error",
        "Error getting appplication directory.",
        [
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Get.theme.colorScheme.onErrorContainer),
              onPressed: () {
                // Close this dialog
                Get.back();
              },
              child: const Text("Ok"))
        ],
        type: DialogType.error);
  }
}
