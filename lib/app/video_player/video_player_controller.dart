import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:get/get.dart';

class VideoPlayerController extends GetxController {
  CachedVideoPlayerPlusController? videoPlayerController;
  bool iSvideoPlaying = false;

  Future<void> displayVideo(String urlVideo) async {
    videoPlayerController = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        urlVideo,
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 3),
    )..initialize().then(
        (value) async {
          await videoPlayerController?.setLooping(false);
          await videoPlayerController?.play();
        },
      );
  }

  Future<void> playVideo() async {
    await videoPlayerController?.play();
    iSvideoPlaying = true;

    // update();
  }

  Future<void> pauseVideo() async {
    await videoPlayerController?.pause();
    iSvideoPlaying = false;
    // update();
  }

  Future<void> replayVideo() async {
    await videoPlayerController?.play();
  }
}
