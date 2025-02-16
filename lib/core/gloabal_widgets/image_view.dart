import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageView extends StatelessWidget {
  String imageUrl;
  ImageView({super.key, required this.imageUrl});
    static const String routeName = "ImageView";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: 100,
        height: 100,
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
    );
  }
}
