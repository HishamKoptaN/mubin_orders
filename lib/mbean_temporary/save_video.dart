// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';

// class VideoRecordingScreen extends StatefulWidget {
//   const VideoRecordingScreen({super.key});

//   @override
//   _VideoRecordingScreenState createState() => _VideoRecordingScreenState();
// }

// class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _initializeControllerFuture = _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     _controller = CameraController(cameras[0], ResolutionPreset.high);
//     return _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> startVideoRecording() async {
//     try {
//       await _initializeControllerFuture;
//       await _controller.startVideoRecording();
//       print('Video recording started');
//     } catch (e) {
//       print('Error starting video recording: $e');
//     }
//   }

//   Future<void> stopVideoRecording() async {
//     try {
//       XFile? file = await _controller.stopVideoRecording();
//       if (file != null) {
//         print('Video recording stopped: ${file.path}');
//         await saveVideoToGallery(file.path);
//       }
//     } catch (e) {
//       print('Error stopping video recording: $e');
//     }
//   }

//   Future<void> saveVideoToGallery(String videoPath) async {
//     final result = await ImageGallerySaver.saveFile(videoPath);
//     if (result['isSuccess']) {
//       print('Video saved to gallery');
//     } else {
//       print('Failed to save video: ${result['errorMessage']}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Video Recording')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (_controller.value.isRecordingVideo) {
//             stopVideoRecording();
//           } else {
//             startVideoRecording();
//           }
//         },
//         child: Icon(
//             _controller.value.isRecordingVideo ? Icons.stop : Icons.videocam),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
