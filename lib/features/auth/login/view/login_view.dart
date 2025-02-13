import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/snacke_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/helper/colors.dart';
import '../../../main/present/view/main_view.dart';
import '../present/bloc/login_bloc.dart';
import '../present/bloc/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final t = S.of(context);

    validator(String? value) {
      if (value == null) {
        return t.required;
      }

      if (value.isEmpty) {
        return t.required;
      }
      return null;
    }

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
              //   Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //     builder: (context) => NavigateBarView(),
              //   ),
              //   (route) => false,
              // );
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
          return Scaffold(
            backgroundColor: white,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Gap(40.h),
                    Image.asset(
                      'assets/icons/mbean_logo_circale.png',
                      height: 100.h,
                      width: 100.w,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(40.h),
                          Container(
                            width: width / 1.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              validator: validator,
                              decoration: InputDecoration(
                                labelText: S.current.email_hint,
                                suffixIcon: const Icon(Icons.email),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                          Gap(20.h),
                          Container(
                            width: width / 1.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              validator: validator,
                              obscureText: showPassword,
                              decoration: InputDecoration(
                                labelText: S.current.password_hint,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        showPassword = !showPassword;
                                      },
                                    );
                                  },
                                  child: Icon(
                                    showPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // context.read<LoginBloc>().add(
                                //       LoginLogin(
                                //         email: _email.text,
                                //         password: _password.text,
                                //       ),
                                //     );
                              }
                            },
                            child: Container(
                              width: width / 2,
                              height: height / 14,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: state.maybeWhen(
                                  loading: () {
                                    return const CircularProgressIndicator(
                                      color: white,
                                    );
                                  },
                                  orElse: () {
                                    return Text(
                                      S.current.login,
                                      style: TextStyle(
                                        color: black,
                                        fontFamily: "Arial",
                                        fontSize: 25.sp,
                                      ),
                                    );
                                  },
                                ),
                              ),
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
