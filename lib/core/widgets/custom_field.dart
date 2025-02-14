import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_text_form_field.dart';

class CustomField extends StatelessWidget {
  CustomField({
    super.key,
    required this.title,
    required this.hintText,
    required this.textInputType,
    this.validator,
    this.onChanged,
    this.maxlines,
    this.backGroundColor,
  });

  final String title, hintText;
  final TextInputType textInputType;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  final int? maxlines;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.medium20.copyWith(
            color: AppColors.moreDarkGreyColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          backGroundColor: backGroundColor ?? AppColors.lightGreyColor,
          maxlines: maxlines ?? 1,
          onChanged: onChanged,
          validator: validator,
          hintText: hintText,
          textInputType: textInputType,
        ),
      ],
    );
  }
}
