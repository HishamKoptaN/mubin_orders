// import 'dart:developer';
// import 'package:awfar_offer_app/all_imports.dart';
// import 'package:awfar_offer_app/core/app_layout.dart';
// import 'package:awfar_offer_app/core/widgets/custom_button.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import '../../../../../core/di/dependency_injection.dart';
// import '../../../../../core/widgets/custom_circular_progress.dart';
// import '../../../../../core/widgets/custom_text.dart';
// import '../../../../../core/widgets/toast_notifier.dart';
// import '../../../../../home_view.dart';
// import '../../data/models/verify_phone_number_req_body_model.dart';
// import '../bloc/login_bloc.dart';
// import '../bloc/login_event.dart';
// import '../bloc/login_state.dart';

// class VerifyPhoneNumberView extends StatefulWidget {
//   static const id = 'VerifyPhoneNumberScreen';
//   const VerifyPhoneNumberView({
//     super.key,
//   });
//   @override
//   State<VerifyPhoneNumberView> createState() => _VerifyPhoneNumberViewState();
// }

// class _VerifyPhoneNumberViewState extends State<VerifyPhoneNumberView>
//     with WidgetsBindingObserver {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   VerifyPhoneNumberReqBodyModel verifyPhoneNumberReqBodyModel =
//       const VerifyPhoneNumberReqBodyModel();
//   final TextEditingController controller = TextEditingController();
//   String initialCountry = 'EG';
//   PhoneNumber number = PhoneNumber(
//     isoCode: 'EG',
//   );
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AppLocalizations t = AppLocalizations.of(context)!;
//     return AppLayout(
//       showAppBar: true,
//       body: BlocProvider(
//         create: (context) => LoginBloc(
//           loginUseCase: getIt(),
//           loginAnonymouslyUseCase: getIt(),
//           loginWithGoogleUseCase: getIt(),
//           loginWithFacebookUseCase: getIt(),
//           loginWithPhoneUseCase: getIt(),
//           firebaseAuth: getIt(),
//         ),
//         child: BlocConsumer<LoginBloc, LoginState>(
//           listener: (context, state) {
//             state.mapOrNull(
//               success: (data) {
//                 Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(
//                     builder: (context) => const HomeView(),
//                   ),
//                   (route) => false,
//                 );
//               },
//               linkSent: (data) {
//                 ToastNotifier().showSuccess(
//                   context: context,
//                   message: t.passw_reset_link_has_been_sent,
//                 );
//               },
//               failure: (error) {
//                 ToastNotifier().showError(
//                   context: context,
//                   message: t.error,
//                 );
//               },
//             );
//           },
//           builder: (context, state) {
//             return Center(
//               child: Column(
//                 children: [
//                   Gap(
//                     15.h,
//                   ),
//                   ClipOval(
//                     child: Image.asset(
//                       'assets/icons/launcher_icon.jpg',
//                       height: 125.h,
//                       width: 125.w,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Gap(
//                         30.h,
//                       ),
//                       SizedBox(
//                         height: 70.h,
//                         width: double.infinity,
//                         child: InternationalPhoneNumberInput(
//                           key: _formKey,
//                           onInputChanged: (v) {
//                             verifyPhoneNumberReqBodyModel =
//                                 verifyPhoneNumberReqBodyModel.copyWith(
//                               phoneNumber: v.phoneNumber,
//                             );
//                             _formKey.currentState!.validate();
//                           },
//                           selectorConfig: const SelectorConfig(
//                             selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                             useBottomSheetSafeArea: true,
//                             trailingSpace: false,
//                           ),
//                           ignoreBlank: false,
//                           autoValidateMode: AutovalidateMode.always,
//                           selectorTextStyle:
//                               const TextStyle(color: Colors.black),
//                           initialValue: number,
//                           textFieldController: controller,
//                           formatInput: true,
//                           keyboardType: const TextInputType.numberWithOptions(
//                             signed: true,
//                             decimal: true,
//                           ),
//                           inputBorder: const OutlineInputBorder(),
//                           hintText: t.phoneNumber,
//                           inputDecoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: InputBorder.none,
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: const BorderSide(
//                                 color: Colors.transparent,
//                                 width: 1.0,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 color: Colors.blue,
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             hintStyle: const TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           locale: "ar",
//                           onSaved: (PhoneNumber number) {
//                             log(
//                               'On Saved: $number',
//                             );
//                           },
//                           validator: (value) {
//                             final sanitizedValue =
//                                 value?.replaceAll(RegExp(r'\s+'), '') ?? '';
//                             if (sanitizedValue.isEmpty) {
//                               return 'الرجاء إدخال رقم الهاتف';
//                             }
//                             if (sanitizedValue.length < 8 ||
//                                 sanitizedValue.length > 15) {
//                               return 'رقم الهاتف يجب أن يكون بين 8 و 15 رقمًا';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Gap(
//                         15.h,
//                       ),
//                       CustomTextButtonWidget(
//                         widget: state.maybeWhen(
//                           loading: () {
//                             return const CustomCircularProgress();
//                           },
//                           orElse: () {
//                             return CustomText(
//                               text: "أرسل الكود",
//                               color: Colors.white,
//                               fontFamily: "Arial",
//                               fontSize: 22.5.sp,
//                               textAlign: TextAlign.center,
//                             );
//                           },
//                         ),
//                         onPressed: () {
//                           log(
//                             verifyPhoneNumberReqBodyModel.phoneNumber!,
//                           );
//                           context.read<LoginBloc>().add(
//                                 LoginEvent.verifyPhoneNumber(
//                                   verifyPhoneNumberReqBodyModel:
//                                       verifyPhoneNumberReqBodyModel,
//                                 ),
//                               );
//                           if (_formKey.currentState!.validate()) {}
//                         },
//                       ),
//                       Gap(
//                         15.h,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void getPhoneNumber(String phoneNumber) async {
//     PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(
//       phoneNumber,
//       'US',
//     );
//     setState(
//       () {
//         this.number = number;
//       },
//     );
//   }
// }
//   //    PhoneFormField(
//                       //    autofocus: true,
//                       //    decoration: InputDecoration(labelText: 'Enter phone number'),
//                       //    initialValue: '',
//                       //    onSaved: (phone) {
//                       //       حفظ رقم الهاتف
//                       //    },
//                       //  )







//                          // CustomTextButtonWidget(
//                       //   widget: state.maybeWhen(
//                       //     loading: () {
//                       //       return const CustomCircularProgress();
//                       //     },
//                       //     orElse: () {
//                       //       return CustomText(
//                       //         text: "تسجيل الدخول برقم الموبيل",
//                       //         color: Colors.white,
//                       //         fontFamily: "Arial",
//                       //         fontSize: 22.5.sp,
//                       //         textAlign: TextAlign.center,
//                       //       );
//                       //     },
//                       //   ),
//                       //   onPressed: () {
//                       //     Navigator.pushAndRemoveUntil(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //         builder: (context) => const VerifyPhoneNumberView(
//                       //           phoneNumber: '01120332361',
//                       //         ),
//                       //       ),
//                       //       (route) => false,
//                       //     );
//                       //   },
//                       // ),