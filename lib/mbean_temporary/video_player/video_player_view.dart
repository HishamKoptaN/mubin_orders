// import 'package:cached_video_player_plus/cached_video_player_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mbean_admin/helpers/media_query.dart';

// import '../../app/home/home_controller.dart';
// import 'video_player_controller.dart';

// class VideoPlayerView extends StatelessWidget {
//   String document;
//   VideoPlayerView({super.key, required this.document});
//   final homeCnr = Get.put(HomeController());
//   final videoDisplayCnr = Get.put(VideoPlayerController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () async {
//             await videoDisplayCnr.videoPlayerController?.pause();
//             Get.back();
//           },
//           child: Icon(
//             Icons.arrow_back,
//             size: context.screenSize * 0.10,
//             color: Colors.green,
//           ),
//         ),
//       ),
//       body: GetBuilder<VideoPlayerController>(
//         init: VideoPlayerController(),
//         builder: (cnr) {
//           cnr.displayVideo(document);
//           return SizedBox(
//             width: context.screenWidth * 100,
//             height: context.screenHeight * 100,
//             child: Center(
//               child: Stack(
//                 children: [
//                   CachedVideoPlayerPlus(cnr.videoPlayerController!),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: GestureDetector(
//                       onTap: () async {
//                         await cnr.replayVideo();
//                       },
//                       child: Icon(
//                         Icons.replay_circle_filled_outlined,
//                         size: context.screenSize * 0.20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
