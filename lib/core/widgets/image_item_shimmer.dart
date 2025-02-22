import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageItemShimmer extends StatelessWidget {
  const ImageItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ترويسة المنشور
            Container(
              width: 100,
              height: 20,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            // نص المنشور (عدة خطوط)
            Container(
              width: double.infinity,
              height: 14,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 14,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Container(
              width: 150,
              height: 14,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            // صورة المنشور
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            // تذييل المنشور (مثل الإعجابات والتعليقات)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  height: 14,
                  color: Colors.white,
                ),
                Container(
                  width: 80,
                  height: 14,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}