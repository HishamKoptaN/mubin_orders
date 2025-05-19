import '../../../../../core/all_imports.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/helper_functions/validator.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_field.dart';
import '../../../../../core/widgets/custom_logo_image.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/snacke_bar.dart';
import '../../../../main/present/view/main_view.dart';
import '../../../data/models/firabase_login_req_body_model.dart';
import '../../../data/models/reset_pass_req_body_model.dart';
import '../../bloc/login_bloc.dart';
import '../../bloc/login_event.dart';
import '../../bloc/login_state.dart';
import 'dont_have_an_account_widget.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({
    super.key,
  });

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

FirabaseLoginReqBodyModel firabaseLoginReqBodyModel =
    const FirabaseLoginReqBodyModel();

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? validated;
  final Validator validator = Validator();
  @override
  Widget build(
    BuildContext context,
  ) {
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
              key: const Key(
                'reset_toast',
              ),
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
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.09),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomLogoImage(
                          width: 200,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "مرحبا بك في الملف الأخضر",
                            style: TextStyles.bold30.copyWith(
                              color: AppColors.darkPrimaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomField(
                          key: const Key('email_field'),
                          onChanged: (v) {
                            firabaseLoginReqBodyModel =
                                firabaseLoginReqBodyModel.copyWith(
                              email: v,
                            );
                            if (validated ?? false) {
                              _formKey.currentState!.validate();
                            }
                          },
                          validator: (v) => Validator.emailValidator(
                            value: v ?? '',
                          ),
                          title: "البريد الألكتروني",
                          hintText: "ادخل البريد الألكتروني هنا",
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomPasswordField(
                          key: const Key('password_field'),
                          onChanged: (v) {
                            firabaseLoginReqBodyModel =
                                firabaseLoginReqBodyModel.copyWith(
                              password: v,
                            );
                            if (validated ?? false) {
                              _formKey.currentState!.validate();
                            }
                          },
                          validator: (v) => Validator.customValidator(
                            value: v ?? '',
                          ),
                          title: "كلمة السر",
                          hintText: "ادخل كلمة السر",
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              key: const Key('forgot_password_button'),
                              onTap: () {
                                if (firabaseLoginReqBodyModel.email != null) {
                                  ResetPassReqBodyModel resetPassReqBodyModel =
                                      const ResetPassReqBodyModel();
                                  resetPassReqBodyModel =
                                      resetPassReqBodyModel.copyWith(
                                    email: firabaseLoginReqBodyModel.email,
                                  );
                                  // context.read<LoginBloc>().add(
                                  //       LoginEvent.resetPass(
                                  //         resetPassReqBodyModel:
                                  //             resetPassReqBodyModel,
                                  //       ),
                                  //     );
                                } else {
                                  CustomToast.showToast(
                                    key: const Key('toast_button'),
                                    context: context,
                                    title: "أدخل البريد الالكتروني",
                                    toastType: ToastType.failure,
                                  );
                                }
                              },
                              child: Text(
                                "هل نسيت كلمة السر؟",
                                style: TextStyles.regular20.copyWith(
                                  color: const Color(0xff63BDFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomButton(
                          key: const Key('login_button'),
                          width: 300,
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
                        const DontHaveAnAccountWidget(),
                        const SizedBox(
                          height: 48,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Image.asset(
                height: MediaQuery.sizeOf(context).height,
                Assets.imagesAuthImage,
                fit: BoxFit.fill,
              ),
            ),
          ],
        );
      },
    );
  }
}
