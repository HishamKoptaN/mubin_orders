import '../../../../../../core/all_imports.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/validator.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../../core/widgets/custom_logo_image.dart';
import '../../../../../../core/widgets/snacke_bar.dart';
import '../../../../../main/present/view/main_view.dart';
import '../../../data/models/firabase_login_req_body_model.dart';
import '../../bloc/login_bloc.dart';
import '../../bloc/login_event.dart';
import '../../bloc/login_state.dart';
import 'dont_have_an_account_widget.dart';

class SigninViewBodyMobileLayout extends StatefulWidget {
  const SigninViewBodyMobileLayout({
    super.key,
  });

  @override
  State<SigninViewBodyMobileLayout> createState() =>
      _SigninViewBodyMobileLayoutState();
}

FirabaseLoginReqBodyModel firabaseLoginReqBodyModel =
    const FirabaseLoginReqBodyModel();

class _SigninViewBodyMobileLayoutState
    extends State<SigninViewBodyMobileLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? validated;
  final Validator validator = Validator();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (data) {
            Navigator.pushNamed(
              context,
              MainView.routeName,
            );
          },
          linkSent: (data) {
            CustomToast.showToast(
              key: const Key('reset_toast'),
              context: context,
              title:
                  "تم ارسال رابط أعادة تعين كلمة المرور الي البريد الالكتروني",
              toastType: ToastType.success,
            );
          },
          failure: (error) {
            CustomToast.showToast(
              key: const Key('login_failure_toast'),
              context: context,
              title: error.apiErrorModel.error ?? '',
              toastType: ToastType.failure,
            );
          },
        );
      },
      builder: (context, state) {
        double width = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.09),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomLogoImage(
                    width: 180,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "مرحبا بك في الملف الأخضر",
                      style: TextStyles.bold20.copyWith(
                        color: AppColors.darkPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // CustomField(
                  //   key: const Key('email_field'),
                  //   onChanged: (v) {
                  //     firabaseLoginReqBodyModel =
                  //         firabaseLoginReqBodyModel.copyWith(
                  //       email: v,
                  //     );
                  //     if (validated ?? false) {
                  //       _formKey.currentState!.validate();
                  //     }
                  //   },
                  //   validator: (v) => Validator.emailValidator(
                  //     value: v ?? '',
                  //   ),
                  //   title: "البريد الألكتروني",
                  //   hintText: "ادخل البريد الألكتروني هنا",
                  //   textInputType: TextInputType.emailAddress,
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // CustomPasswordField(
                  //   key: const Key('password_field'),
                  //   onChanged: (v) {
                  //     firabaseLoginReqBodyModel =
                  //         firabaseLoginReqBodyModel.copyWith(
                  //       password: v,
                  //     );
                  //     if (validated ?? false) {
                  //       _formKey.currentState!.validate();
                  //     }
                  //   },
                  //   validator: (v) => Validator.customValidator(
                  //     value: v ?? '',
                  //   ),
                  //   title: "كلمة السر",
                  //   hintText: "ادخل كلمة السر",
                  //   textInputType: TextInputType.visiblePassword,
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // Row(
                  //   children: [
                  //     GestureDetector(
                  //       key: const Key('forgot_password_button'),
                  //       onTap: () {
                  //         if (firabaseLoginReqBodyModel.email != null) {
                  //           ResetPassReqBodyModel resetPassReqBodyModel =
                  //               const ResetPassReqBodyModel();
                  //           resetPassReqBodyModel =
                  //               resetPassReqBodyModel.copyWith(
                  //             email: firabaseLoginReqBodyModel.email,
                  //           );
                  //           context.read<LoginBloc>().add(
                  //                 LoginEvent.resetPass(
                  //                   resetPassReqBodyModel:
                  //                       resetPassReqBodyModel,
                  //                 ),
                  //               );
                  //         } else {
                  //           CustomToast.showToast(
                  //             key: const Key('toast_button'),
                  //             context: context,
                  //             title: "أدخل البريد الالكتروني",
                  //             toastType: ToastType.failure,
                  //           );
                  //         }
                  //       },
                  //       child: Text(
                  //         "هل نسيت كلمة السر؟",
                  //         style: TextStyles.regular20.copyWith(
                  //           color: const Color(0xff63BDFF),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    key: const Key('login_button'),
                    width: double.infinity,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<LoginBloc>().add(
                              LoginEvent.fireLogin(
                                firabaseLoginReqBodyModel:
                                    firabaseLoginReqBodyModel,
                              ),
                            );
                      } else {
                        validated = true;
                      }
                    },
                    widget: state.maybeWhen(
                      loading: () {
                        return const CustomCircularProgress();
                      },
                      orElse: () {
                        return Text(
                          "تسجيل الدخول",
                          style: TextStyles.medium15.copyWith(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DontHaveAnAccountWidget(),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
