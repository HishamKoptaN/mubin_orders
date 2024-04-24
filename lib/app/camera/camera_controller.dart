import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class VideoRecordingController extends GetxController {
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
      print(e);
    }
  }

  Future<void> stopVideoRecording() async {
    stopRecordingTimer();
    recordingDuration = 0;
    try {
      XFile? file = await cameraController!.stopVideoRecording();
      await saveVideoToGallery(file.path);
      isRecording = false;
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
