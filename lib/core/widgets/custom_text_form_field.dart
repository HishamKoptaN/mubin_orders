import '../all_imports.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.maxlines,
    this.backGroundColor,
    this.validator,
    this.onChanged,
  });

  String? Function(String?)? validator;
  void Function(String)? onChanged;
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxlines;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines ?? 1,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hoverColor: Colors.transparent,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.regular20.copyWith(
          color: AppColors.darkGreyColor,
        ),
        filled: true,
        fillColor: backGroundColor ?? AppColors.lightGreyColor,
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
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: AppColors.lightGreyColor,
        width: 1.h,
      ),
    );
  }
}
