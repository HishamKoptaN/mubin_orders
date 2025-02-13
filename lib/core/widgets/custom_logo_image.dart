import 'package:flutter/material.dart';

import '../utils/app_images.dart';

class CustomLogoImage extends StatelessWidget {
  const CustomLogoImage({
    super.key,
    required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesLogopng,
      width: width,
    );
  }
}
