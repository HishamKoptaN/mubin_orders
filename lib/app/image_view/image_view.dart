import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_talabat/global/media_query.dart';
import 'package:shimmer/shimmer.dart';

import 'image_view_controller.dart';

class ImageView extends StatelessWidget {
  String document;
  ImageView({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(),
        body: GetBuilder<ImageController>(
          init: ImageController(),
          builder: (cnr) {
            return SizedBox(
              width: context.screenWidth * 100,
              height: context.screenHeight * 100,
              child: Center(
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: document,
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
            );
          },
        ),
      ),
    );
  }
}
