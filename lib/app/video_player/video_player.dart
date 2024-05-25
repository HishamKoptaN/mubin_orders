import 'package:flutter/material.dart';
import 'package:mbean_admin/main.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final double height;
  final double width;
  const VideoPlayerScreen(
      {Key? key,
      required this.videoUrl,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then(
        (_) {
          _controller.play();
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _controller.value.isInitialized
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: AspectRatio(
                  aspectRatio: widget.width / widget.height,
                  child: VideoPlayer(_controller),
                ),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              },
            );
          },
          child: Icon(
            size: setFont(context, 45),
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
