import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:mbean_admin/helpers/media_query.dart';
import '../../helpers/constants.dart';
import 'camera_controller.dart';

class VideoRecordingScreen extends GetView<VideoRecordingController> {
  const VideoRecordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constriants) {
            return Stack(
              children: [
                GetBuilder<VideoRecordingController>(
                  init: VideoRecordingController(),
                  builder: (cnr) {
                    if (cnr.isCameraInitialized) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            top: 50,
                            child: AspectRatio(
                                aspectRatio: 50,
                                child: CameraPreview(cnr.cameraController!)),
                          ),
                          Positioned(
                            top: context.screenHeight * 10,
                            right: context.screenWidth * 7,
                            child: Text(
                              '${cnr.recordingDuration} s',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.screenSize * sixFont,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: context.screenHeight * 20,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(110, 0, 0, 0),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    cnr.isRecording
                                        ? cnr.stopVideoRecording()
                                        : cnr.startVideoRecording();
                                  },
                                  child: Container(
                                    height: context.screenHeight * 10,
                                    width: context.screenWidth * 22,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 4,
                                          color: Colors.white,
                                          style: BorderStyle.solid),
                                    ),
                                    child: Icon(
                                      cnr.isRecording
                                          ? Icons.stop
                                          : Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: context.screenSize * 0.25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
