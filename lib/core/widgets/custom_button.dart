import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.widget,
    this.backgroundColor,
    this.width,
    this.height,
    this.colorSide,
  });

  final VoidCallback onPressed;
  final String? text;
  final Widget? widget;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? colorSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 42,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: colorSide ?? Colors.transparent,
                width: 1,
              )),
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: widget ??
            Text(
              text ?? '',
              style: TextStyles.medium15.copyWith(color: Colors.white),
            ),
      ),
    );
  }
}
