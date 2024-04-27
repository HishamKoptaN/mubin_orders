// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   final String videoPath;

//   const VideoScreen({Key? key, required this.videoPath}) : super(key: key);

//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then(
//         (_) {
//           setState(() {});
//         },
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : const CircularProgressIndicator(),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(
//       //       () {
//       //         if (_controller.value.isPlaying) {
//       //           _controller.pause();
//       //         } else {
//       //           _controller.play();
//       //         }
//       //       },
//       //     );
//       //   },
//       //   child: Icon(
//       //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//       //   ),
//       // ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose(); // يتم التخلص من المشغل عند تدمير الواجهة
//   }
// }
