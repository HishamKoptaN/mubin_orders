import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.onTap,
    this.hint,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
  });
  final TextEditingController? controller;
  final Function()? onTap;
  final String? labelText;
  final String? hint;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final IconData? suffixIcon;
  final bool obscureText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 300.w,
        height: 50.w,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(suffixIcon, color: Colors.grey),
            floatingLabelStyle: const TextStyle(
              color: AppColors.customRed,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xFFD92728),
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
