import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImagePreview extends StatelessWidget {
  final String imageUrl;

  const ImagePreview({
    super.key,
    required this.imageUrl,
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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: width,
                height: height,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
