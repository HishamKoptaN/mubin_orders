import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String imageUrl;

  const ImagePreview({super.key, required this.imageUrl,
  });

  static const String routeName = "ImagePreview";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
          // Enable zooming and panning
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,  // Use BoxFit.contain to maintain aspect ratio
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
