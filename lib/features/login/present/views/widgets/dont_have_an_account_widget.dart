import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushReplacementNamed(
        //   context,
        //   JobSeekerOrCompanyOwnerView.routeName,
        // );
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "ليس لديك حساب؟",
              style: TextStyles.regular18,
            ),
            TextSpan(
              text: "انشاء حساب؟",
              style: TextStyles.bold18.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
