import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;

  const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isError = false; // لتتبع حالة الخطأ في تحميل الفيديو

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then(
        (_) {
          if (mounted) setState(() {});
        },
      ).catchError(
        (error) {
          setState(
            () {
              _isError = true;
            },
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0), // زوايا ناعمة للفيديو
      child: AspectRatio(
        aspectRatio: _controller.value.isInitialized
            ? _controller.value.aspectRatio
            : _controller.value.aspectRatio, // عرض افتراضي عند التحميل
        child: _isError
            ? _buildErrorWidget() // عرض ويدجت الخطأ عند الفشل
            : _controller.value.isInitialized
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      const Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.red,
                        size: 50,
                      ),
                    ],
                  )
                : _buildLoadingWidget(), // عرض تأثير التحميل عند انتظار الفيديو
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        color: Colors.white,
      ),
    );
  }

  /// ويدجت الخطأ عند فشل تحميل الفيديو
  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(
          Icons.broken_image,
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
