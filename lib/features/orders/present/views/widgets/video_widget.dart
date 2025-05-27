import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/gloabal_widgets/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl; // ✅ thumbnail

  const VideoWidget({
    Key? key,
    required this.videoUrl,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isError = false;
  bool _isPlaying = false;

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
          setState(() {
            _isError = true;
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: AspectRatio(
        aspectRatio: _controller.value.isInitialized
            ? _controller.value.aspectRatio
            : 16 / 9,
        child: _isError
            ? _buildErrorWidget()
            : _isPlaying
                ? VideoPlayer(_controller)
                : _buildThumbnail(),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          widget.thumbnailUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildLoadingWidget();
          },
          errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
        ),
        IconButton(
          icon: const Icon(Icons.play_circle_fill, size: 60, color: Colors.red),
          onPressed: () {
            Navigator.pushNamed(
              context,
              VideoPlayerView.routeName,
              arguments: {
                'video_url': widget.videoUrl,
              },
            );
          },
        ),
      ],
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
