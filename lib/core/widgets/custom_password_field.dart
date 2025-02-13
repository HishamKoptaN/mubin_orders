import 'package:flutter/material.dart';
import '../../../core/widgets/custom_password_form_field.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomPasswordField extends StatelessWidget {
  CustomPasswordField({
    super.key,
    required this.title,
    required this.hintText,
    required this.textInputType,
    this.validator,
    this.onChanged,
  });

  final String title, hintText;
  final TextInputType textInputType;
  String? Function(String?)? validator;
  void Function(String)? onChanged;

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
        SizedBox(
          height: 8,
        ),
        CustomPasswordFormField(
          onChanged: onChanged,
          validator: validator,
          hintText: hintText,
          textInputType: textInputType,
        ),
      ],
    );
  }
}
