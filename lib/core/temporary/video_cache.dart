// import 'package:flutter/material.dart';
// import 'package:cached_video_player_plus/cached_video_player_plus.dart';

// class VideoCahing extends StatefulWidget {
//   String videoUrl;

//   VideoCahing({super.key, required this.videoUrl});

//   @override
//   State<VideoCahing> createState() => _VideoCahingState();
// }

// class _VideoCahingState extends State<VideoCahing> {
//   late CachedVideoPlayerPlusController controller;
//   String videoUrl =
//       'https://firebasestorage.googleapis.com/v0/b/document-orders.appspot.com/o/somal_orders%2F1%2Fvideo.mp4?alt=media&token=dd669577-a0cb-4843-9dc1-690659e86626';
//   @override
//   void initState() {
//     super.initState();

//     controller = CachedVideoPlayerPlusController.networkUrl(
//       Uri.parse(
//         videoUrl,
//       ),
//       httpHeaders: {
//         'Connection': 'keep-alive',
//       },
//       invalidateCacheIfOlderThan: const Duration(days: 2),
//     )..initialize().then(
//         (value) async {
//           await controller.setLooping(true);
//           setState(() {});
//         },
//       );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: controller.value.aspectRatio,
//                 child: CachedVideoPlayerPlus(controller),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }
