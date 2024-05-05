// import 'package:docs_orders/helpers/media_query.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../reset_password/reset_pass.dart';
// import 'login_register_controller.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.black,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: [
//                 GetBuilder<UserDataController>(
//                   init: UserDataController(),
//                   builder: (controller) {
//                     return Column(
//                       children: [
//                         Row(
//                           children: [
//                             Icon(Icons.chevron_right_outlined,
//                                 color: Colors.amber,
//                                 size: context.screenSize * 0.4),
//                             SizedBox(
//                               width: context.screenWidth * 40,
//                               height: context.screenHeight * 25,
//                               child: Center(
//                                 child: Text(
//                                   'Login',
//                                   style: GoogleFonts.cairo(
//                                       color: Colors.white,
//                                       fontSize: context.fontSize * 0.12,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: SizedBox(
//                             child: MyButton(
//                               height: context.screenSize * 0.25,
//                               width: context.screenSize * 0.4,
//                               ontap: controller.signIn,
//                               text: "Login",
//                               fontSize: context.fontSize * 0.1,
//                               style: FilledButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 foregroundColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(0),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: context.screenHeight * 1,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             MyTextField(
//                               controller: controller.loginEmailController,
//                               hintText: "Email",
//                               obscure: false,
//                               icon: Icons.email_outlined,
//                               iconeSize: context.screenSize * .1,
//                               textfontSize: context.screenSize * 0.07,
//                             ),
//                             SizedBox(
//                               height: context.screenHeight * 2,
//                             ),
//                             MyTextField(
//                               controller: controller.loginPassController,
//                               hintText: "Password",
//                               obscure: true,
//                               icon: Icons.lock,
//                               iconeSize: context.screenSize * .1,
//                               textfontSize: context.screenSize * 0.07,
//                             ),
//                             SizedBox(
//                               height: context.screenHeight * 2,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     Get.to(
//                                       const ResetPass(),
//                                     );
//                                   },
//                                   child: Mytext(
//                                     text: 'forgot password?',
//                                     fonstSize: context.fontSize * .06,
//                                   ),
//                                 ),
//                                 SizedBox(width: context.screenSize * 0.06),
//                                 Mytext(
//                                   text: 'Remember me',
//                                   fonstSize: context.fontSize * .06,
//                                 ),
//                                 Checkbox(
//                                   value: controller.isChecked.value,
//                                   onChanged: (value) =>
//                                       controller.toggleCheckbox(),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: context.screenHeight * 5),
//                             GestureDetector(
//                               // onTap: userData.signInWithGoogle,
//                               child: Container(
//                                 width: context.screenWidth * 75,
//                                 height: context.screenHeight * 10,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       'assets/icons/googleIcon.png',
//                                       width: context.screenWidth * 10,
//                                       height: context.screenHeight * 10,
//                                     ),
//                                     Text(
//                                       'Sign in with google',
//                                       style: TextStyle(
//                                           fontSize: context.fontSize * .07,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: context.screenHeight * 2),
//                         Positioned(
//                           top: controller.showWhat == null ? 420 : null,
//                           right: 0,
//                           bottom: controller.showWhat == null ? null : 0,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   controller.showRegister();
//                                 },
//                                 child: Container(
//                                   width: 80,
//                                   height: 80,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.amber,
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 3,
//                                     ),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Colors.black,
//                                         spreadRadius: 5,
//                                         blurRadius: 7,
//                                         offset: Offset(0, 3),
//                                       ),
//                                     ],
//                                   ),
//                                   child: const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Colors.white,
//                                     size: 70,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 4),
//                               GestureDetector(
//                                 onTap: () {
//                                   controller.hideRegister();
//                                 },
//                                 child: Container(
//                                   width: 80,
//                                   height: 80,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.transparent,
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 3,
//                                     ),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Colors.black,
//                                         spreadRadius: 5,
//                                         blurRadius: 7,
//                                         offset: Offset(0, 3),
//                                       ),
//                                     ],
//                                   ),
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.keyboard_arrow_up,
//                                       color: Colors.white,
//                                       size: 70,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         if (controller.registerIsExtended)
//                           Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: Colors.amber,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(height: 20),
//                                     MyTextField(
//                                       hintText: 'Full Name',
//                                       icon: Icons.person,
//                                       controller:
//                                           controller.registerNamelController,
//                                       obscure: false,
//                                       iconeSize: context.screenSize * .1,
//                                       textfontSize: context.screenSize * .06,
//                                     ),
//                                     SizedBox(height: context.screenHeight * 2),
//                                     MyTextField(
//                                       hintText: 'Email',
//                                       icon: Icons.email,
//                                       controller:
//                                           controller.registerEmailController,
//                                       obscure: false,
//                                       iconeSize: context.screenSize * .1,
//                                       textfontSize: context.screenSize * .06,
//                                     ),
//                                     SizedBox(height: context.screenHeight * 2),
//                                     MyTextField(
//                                       hintText: 'Password',
//                                       icon: Icons.lock,
//                                       controller:
//                                           controller.registerPasswordController,
//                                       obscure: true,
//                                       iconeSize: context.screenSize * .1,
//                                       textfontSize: context.screenSize * .06,
//                                     ),
//                                     SizedBox(height: context.screenHeight * 2),
//                                     MyTextField(
//                                       hintText: 'Confirm Password',
//                                       icon: Icons.lock,
//                                       controller: controller
//                                           .registerConfirmPasswordController,
//                                       obscure: true,
//                                       iconeSize: context.screenSize * .1,
//                                       textfontSize: context.screenSize * .06,
//                                     ),
//                                     SizedBox(height: context.screenHeight * 2),
//                                     MyTextField(
//                                       hintText: 'Phone Number',
//                                       icon: Icons.phone,
//                                       controller: controller
//                                           .registerPhoneNumberController,
//                                       obscure: false,
//                                       iconeSize: context.screenSize * .1,
//                                       textfontSize: context.screenSize * .06,
//                                     ),
//                                     SizedBox(height: context.screenHeight * 2),
//                                     SizedBox(
//                                       height: context.screenHeight * 15,
//                                       width: context.screenWidth * 50,
//                                       child: MyButton(
//                                         height: context.screenHeight * 10,
//                                         width: context.screenWidth * 40,
//                                         ontap: controller.signUp,
//                                         text: "Sign Up",
//                                         fontSize: context.screenSize * 0.1,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: context.screenHeight * 10,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Mytext extends StatelessWidget {
//   Mytext({
//     super.key,
//     required this.text,
//     required this.fonstSize,
//   });
//   String text;
//   double fonstSize;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(color: Colors.white, fontSize: fonstSize),
//     );
//   }
// }

// class MyTextField extends StatelessWidget {
//   final IconData? icon;
//   final String? hintText;
//   final TextEditingController? controller;
//   final bool? obscure;
//   final double? iconeSize;
//   final double? textfontSize;
//   const MyTextField({
//     super.key,
//     this.icon,
//     this.hintText,
//     this.controller,
//     this.obscure = false,
//     InputDecoration? decoration,
//     required this.iconeSize,
//     required this.textfontSize,
//   });
//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email address';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       style: TextStyle(color: Colors.black, fontSize: textfontSize),
//       controller: controller,
//       obscureText: obscure!,
//       decoration: InputDecoration(
//         labelStyle: const TextStyle(color: Colors.brown),
//         prefixIcon: Icon(
//           icon,
//           size: iconeSize,
//           color: Colors.black,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//         fillColor: Colors.white,
//         filled: true,
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.grey),
//       ),
//     );
//   }
// }

// class MyButton extends StatelessWidget {
//   Function()? ontap;
//   String text;
//   double? fontSize;
//   double? height;
//   double? width;
//   MyButton(
//       {super.key,
//       required this.fontSize,
//       this.ontap,
//       required this.text,
//       required this.height,
//       required this.width,
//       ButtonStyle? style});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: ontap,
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(8)),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: fontSize,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
