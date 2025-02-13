import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomPasswordFormField extends StatefulWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final double? height;
  final double? width;
  final InputBorder? border;
  final String? hintText;
  final TextInputType? textInputType;
  final Color? backGroundColor;

  const CustomPasswordFormField({
    super.key,
    this.labelText,
    this.onChanged,
    this.validator,
    this.height,
    this.width,
    this.obscureText = true,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.border,
    this.hintText,
    this.backGroundColor,
    this.textInputType,
  });

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backGroundColor ?? AppColors.lightGreyColor,
        hintText: widget.hintText,
        hintStyle: TextStyles.regular20.copyWith(
          color: AppColors.darkGreyColor,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.h,
          ),
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.lightGreyColor,
        width: 1.h,
      ),
    );
  }
}
