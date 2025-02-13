import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mbean_talabat/core/global/media_query.dart';
import 'package:shimmer/shimmer.dart';

class ImageView extends StatelessWidget {
  String imageUrl;
  ImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: context.screenWidth * 100,
          height: context.screenHeight * 100,
          child: Center(
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const SizedBox(),
                  ),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
