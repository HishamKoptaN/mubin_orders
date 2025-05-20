import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.enabled,
    this.readOnly,
    this.onTap,
    this.hint,
    this.textInputType,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode,
    this.obscureText = false,
    this.maxLines = 1,
  });
  final TextEditingController? controller;
  final Function()? onTap;
  final String? labelText;
  final bool? enabled;
  final bool? readOnly;
  final String? hint;
  final TextInputType? textInputType;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData? suffixIcon;
  final bool obscureText;
  final int maxLines;
  @override
  Widget build(
    BuildContext contex,
  ) {
    return SizedBox(
      height: 75.h,
      width: 300.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        enabled: enabled ?? true,
        obscureText: obscureText,
        validator: validator,
        maxLines: maxLines,
        onTap: onTap,
        readOnly: readOnly ?? false,
        autovalidateMode: autovalidateMode,
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
    );
  }
}
