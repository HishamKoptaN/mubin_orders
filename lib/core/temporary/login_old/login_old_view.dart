// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mbean_talabat/global/media_query.dart';
// import 'package:provider/provider.dart';
// import '../../generated/l10n.dart';
// import '../main/bloc/main_bloc.dart';
// import 'login_provider.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});
//   @override
//   Widget build(BuildContext context) {
// LoginProvider loginProvider = LoginProvider();

//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => MainBloc(),
//         child: BlocConsumer<LoginProvider>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             if (state) {}
//             return SafeArea(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Stack(
//                     children: [
//                        Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Icon(Icons.chevron_right_outlined,
//                                       color: Colors.amber,
//                                       size: context.screenSize * 0.4),
//                                   SizedBox(
//                                     width: context.screenWidth * 40,
//                                     height: context.screenHeight * 25,
//                                     child: Center(
//                                       child: Text(
//                                         S.of(context).login_text,
//                                         style: GoogleFonts.cairo(
//                                             color: Colors.white,
//                                             fontSize: context.fontSize * 0.12,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   MyButton(
//                                     height: context.screenSize * 0.25,
//                                     width: context.screenSize * 0.4,
//                                     ontap: () => cnr.signIn(context),
//                                     text: S.of(context).login,
//                                     fontSize: context.fontSize * 0.1,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: context.screenHeight * 1,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   MyTextField(
//                                     controller: cnr.loginEmailController,
//                                     hintText: S.of(context).email_hint,
//                                     obscure: false,
//                                     icon: Icons.email_outlined,
//                                     iconeSize: context.screenSize * .1,
//                                     textfontSize: context.screenSize * 0.07,
//                                   ),
//                                   SizedBox(
//                                     height: context.screenHeight * 2,
//                                   ),
//                                   MyTextField(
//                                     controller: cnr.loginPassController,
//                                     hintText: S.of(context).password_hint,
//                                     obscure: true,
//                                     icon: Icons.lock,
//                                     iconeSize: context.screenSize * .1,
//                                     textfontSize: context.screenSize * 0.07,
//                                   ),
//                                   SizedBox(
//                                     height: context.screenHeight * 2,
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(width: context.screenSize * 0.06),
//                                   Mytext(
//                                     text: S.of(context).remember_me,
//                                     fonstSize: context.fontSize * .06,
//                                   ),
//                                   Checkbox(
//                                     value: cnr.isChecked,
//                                     onChanged: (value) => cnr.toggleCheckbox(),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 width:200,
//                                 height:100,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.grey,
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(50.0),
//                                   ),
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                         width:200,
//                                         height: 100,
//                                         decoration: const BoxDecoration(
//                                           color: Colors.lightGreen,
//                                           borderRadius: BorderRadius.all(
//                                             Radius.circular(50.0),
//                                           ),
//                                         ),
//                                       ),
//                                     GestureDetector(
//                                       onTap: () async {
//                                         await loginProvider.selectLang(
//                                             "en", context);
//                                       },
//                                       child: Align(
//                                         alignment: const Alignment(-1, 0),
//                                         child: Container(
//                                           width:200,
//                                           color: Colors.transparent,
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             'English',
//                                             style: TextStyle(
//                                               color:Colors.amber,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () async {
//                                         await loginProvider.selectLang(
//                                             "ar", context);
//                                       },
//                                       child: Align(
//                                         alignment: const Alignment(1, 0),
//                                         child: Container(
//                                           width:200,
//                                           color: Colors.transparent,
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             'عربي',
//                                             style: TextStyle(
//                                               color: Colors.amber,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )]

//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Mytext extends StatelessWidget {
//   final String text;
//   final double fonstSize;

//   const Mytext({
//     super.key,
//     required this.text,
//     required this.fonstSize,
//   });

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
//     required this.iconeSize,
//     required this.textfontSize,
//   });

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
//   final Function()? ontap;
//   final String text;
//   final double? fontSize;
//   final double? height;
//   final double? width;

//   const MyButton({
//     super.key,
//     required this.fontSize,
//     this.ontap,
//     required this.text,
//     required this.height,
//     required this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(8)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
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
