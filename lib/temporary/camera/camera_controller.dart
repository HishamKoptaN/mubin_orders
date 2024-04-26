import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VideoRecordingController extends GetxController {
  final loc.Location location = loc.Location();
  final TextEditingController _nameController = TextEditingController();
  LatLng currentLocation = const LatLng(0, 0);
  // AddStudentPage addStudentPage = AddStudentPage();
  late CameraController? cameraController;
  final TextEditingController videoNameController = TextEditingController();
  final RxString videoPath = "".obs;
  final RxString errorMessage = "".obs;
  final errorType = 0.obs;
  bool isRecording = false;
  bool isCameraInitialized = false;
  int recordingDuration = 0;
  late Timer timer;
  @override
  void onInit() async {
    await initializeCamera();
    isRecording.obs;
    super.onInit();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await cameraController!.initialize();
    isCameraInitialized = true;
  }

  Future<void> startVideoRecording() async {
    startRecordingTimer();
    try {
      await cameraController!.startVideoRecording();
      isRecording = true;
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> stopVideoRecording() async {
    await getCurrentLocation();
    stopRecordingTimer();
    recordingDuration = 0;

    try {
      XFile? file = await cameraController!.stopVideoRecording();
      await saveVideoToGallery(file.path);
      isRecording = false;
      // addStudentPage.addStudent(file.path, file.path, file.path);
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final loc.LocationData locationResult = await location.getLocation();
      currentLocation =
          LatLng(locationResult.latitude!, locationResult.longitude!);

      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> saveVideoToGallery(String videoPath) async {
    final result = await ImageGallerySaver.saveFile(videoPath);
    if (result['isSuccess']) {
      print('Video saved to gallery');
    } else {
      print('Failed to save video: ${result['errorMessage']}');
    }
  }

  void startRecordingTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        recordingDuration++;
        update();
      },
    );
  }

  void stopRecordingTimer() {
    timer.cancel();
  }
}
