import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/helper_functions/validator.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_logo_image.dart';
import '../../../../../core/widgets/custom_password_form_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/snacke_bar.dart';
import '../../../../home/home_view.dart';
import '../../data/models/firabase_login_req_body_model.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirabaseLoginReqBodyModel firabaseLoginReqBodyModel =
      const FirabaseLoginReqBodyModel();
  bool? validated;
  final Validator validator = Validator();
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        firebaseLoginUseCase: getIt(),
        loginUseCase: getIt(),
        firebaseAuth: getIt(),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (data) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeView.routeName,
                (route) => false,
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
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Gap(
                      40.h,
                    ),
                    const CustomLogoImage(
                      width: 180,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(
                            40.h,
                          ),
                          CustomTextFormField(
                            key: const Key('email_field'),
                            backGroundColor: AppColors.lightGreyColor,
                            maxlines: 1,
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
                            textInputType: TextInputType.emailAddress,
                            hintText: t.email_hint,
                          ),
                          Gap(
                            10.h,
                          ),
                          CustomPasswordFormField(
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
                            hintText: t.password_hint,
                            textInputType: TextInputType.visiblePassword,
                          ),
                          Gap(
                            20.h,
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
                            backgroundColor: Colors.amber,
                            widget: state.maybeWhen(
                              loading: () {
                                return const CustomCircularProgress();
                              },
                              orElse: () {
                                return Text(
                                  t.login,
                                  style: TextStyles.medium22.copyWith(
                                    color: Colors.black,
                                  ),
                                );
                              },
                            ),
                          ),
                          Gap(
                            70.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
