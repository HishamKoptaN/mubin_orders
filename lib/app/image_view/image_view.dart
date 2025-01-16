import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:shimmer/shimmer.dart';
=======
import 'package:mbean_talabat/global/media_query.dart';
import 'package:shimmer/shimmer.dart';

>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
import 'image_view_controller.dart';

class ImageView extends StatelessWidget {
  String document;
  ImageView({super.key, required this.document});
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ImageController>(
        init: ImageController(),
        builder: (cnr) {
          return Expanded(
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
=======

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
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
      ),
    );
  }
}
