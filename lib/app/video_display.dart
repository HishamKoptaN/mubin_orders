import 'package:flutter/material.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:get/get.dart';

class VideoCaching extends StatelessWidget {
  final String initialVideoUrl;

  VideoCaching({Key? key, required this.initialVideoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      init: VideoController(initialVideoUrl),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child:
                controller.cachedVideoPlayerPlusController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: controller
                            .cachedVideoPlayerPlusController.value.aspectRatio,
                        child: CachedVideoPlayerPlus(
                            controller.cachedVideoPlayerPlusController),
                      )
                    : const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class VideoController extends GetxController {
  late CachedVideoPlayerPlusController cachedVideoPlayerPlusController;
  var videoUrl = '';

  VideoController(this.videoUrl) {
    cachedVideoPlayerPlusController =
        CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(videoUrl),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 2),
    )..initialize().then((value) async {
            await cachedVideoPlayerPlusController.setLooping(true);
          });
  }

  void changeVideoUrl(String newUrl) {
    videoUrl = newUrl;
    cachedVideoPlayerPlusController =
        CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(videoUrl),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 2),
    )..initialize().then((value) async {
            await cachedVideoPlayerPlusController.setLooping(true);
          });
  }

  @override
  void onClose() {
    cachedVideoPlayerPlusController.dispose();
    super.onClose();
  }
}
