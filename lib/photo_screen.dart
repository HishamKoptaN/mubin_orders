import 'dart:html';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  PhotoScreen({required this.cameras});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  late CameraController controller;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;

  bool isCapturing = false;
  int _selectedCameraIndex = 0;
  bool _isFlash = false;
  Offset? _focusPoint;
  double _currentZoom = 1.0;
  File? _capturedImage;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then(
          (_) => {
            if (!mounted) {setState(() {})}
          },
        );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constriants) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller != null
                                ? onFlashModeButtonPressed
                                : null;
                          },
                          child: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: CameraPreview(controller),
                ),
                Positioned(bottom: 0, left: 0, right: 0, child: Container())
              ],
            );
          },
        ),
      ),
    );
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
      _exposureModeControlRowAnimationController.reverse();
      _focusModeControlRowAnimationController.reverse();
    }
  }

  IconData getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
    }
    // This enum is from a different package, so a new value could be added at
    // any time. The example should keep working if that happens.
    // ignore: dead_code
    return Icons.camera;
  }
}
