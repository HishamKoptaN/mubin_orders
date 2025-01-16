import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbean_admin/helpers/media_query.dart';
import '../../generated/l10n.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (cnr) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.chevron_right_outlined,
                                color: Colors.amber,
                                size: context.screenSize * 0.4),
                            SizedBox(
                              width: context.screenWidth * 40,
                              height: context.screenHeight * 25,
                              child: Center(
                                child: Text(
                                  S.of(context).login_text,
                                  style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: context.fontSize * 0.12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              height: context.screenSize * 0.25,
                              width: context.screenSize * 0.4,
                              ontap: cnr.signIn,
                              text: S.of(context).login,
                              fontSize: context.fontSize * 0.1,
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.screenHeight * 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextField(
                              controller: cnr.loginEmailController,
                              hintText: S.of(context).email_hint,
                              obscure: false,
                              icon: Icons.email_outlined,
                              iconeSize: context.screenSize * .1,
                              textfontSize: context.screenSize * 0.07,
                            ),
                            SizedBox(
                              height: context.screenHeight * 2,
                            ),
                            MyTextField(
                              controller: cnr.loginPassController,
                              hintText: S.of(context).password_hint,
                              obscure: true,
                              icon: Icons.lock,
                              iconeSize: context.screenSize * .1,
                              textfontSize: context.screenSize * 0.07,
                            ),
                            SizedBox(
                              height: context.screenHeight * 2,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: context.screenSize * 0.06),
                            Mytext(
                              text: S.of(context).remember_me,
                              fonstSize: context.fontSize * .06,
                            ),
                            Checkbox(
                              value: cnr.isChecked.value,
                              onChanged: (value) => cnr.toggleCheckbox(),
                            ),
                          ],
                        ),
                        Container(
                          width: cnr.width,
                          height: cnr.height,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          child: Stack(
                            children: [
                              AnimatedAlign(
                                alignment: Alignment(cnr.xAlign, 0),
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  width: cnr.width * 0.5,
                                  height: cnr.height,
                                  decoration: const BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await cnr.selectEn();
                                },
                                child: Align(
                                  alignment: const Alignment(-1, 0),
                                  child: Container(
                                    width: cnr.width * 0.5,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'English',
                                      style: TextStyle(
                                        color: cnr.loginColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await cnr.selectAr();
                                },
                                child: Align(
                                  alignment: const Alignment(1, 0),
                                  child: Container(
                                    width: cnr.width * 0.5,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'عربي',
                                      style: TextStyle(
                                        color: cnr.signInColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
=======
import 'package:google_fonts/google_fonts.dart';
import 'package:mbean_talabat/global/media_query.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import 'login_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Consumer<LoginProvider>(
      builder: (context, cnr, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Consumer<LoginProvider>(
                      builder: (context, cnr, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.chevron_right_outlined,
                                    color: Colors.amber,
                                    size: context.screenSize * 0.4),
                                SizedBox(
                                  width: context.screenWidth * 40,
                                  height: context.screenHeight * 25,
                                  child: Center(
                                    child: Text(
                                      S.of(context).login_text,
                                      style: GoogleFonts.cairo(
                                          color: Colors.white,
                                          fontSize: context.fontSize * 0.12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                MyButton(
                                  height: context.screenSize * 0.25,
                                  width: context.screenSize * 0.4,
                                  ontap: () => cnr.signIn(context),
                                  text: S.of(context).login,
                                  fontSize: context.fontSize * 0.1,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.screenHeight * 1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyTextField(
                                  controller: cnr.loginEmailController,
                                  hintText: S.of(context).email_hint,
                                  obscure: false,
                                  icon: Icons.email_outlined,
                                  iconeSize: context.screenSize * .1,
                                  textfontSize: context.screenSize * 0.07,
                                ),
                                SizedBox(
                                  height: context.screenHeight * 2,
                                ),
                                MyTextField(
                                  controller: cnr.loginPassController,
                                  hintText: S.of(context).password_hint,
                                  obscure: true,
                                  icon: Icons.lock,
                                  iconeSize: context.screenSize * .1,
                                  textfontSize: context.screenSize * 0.07,
                                ),
                                SizedBox(
                                  height: context.screenHeight * 2,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: context.screenSize * 0.06),
                                Mytext(
                                  text: S.of(context).remember_me,
                                  fonstSize: context.fontSize * .06,
                                ),
                                Checkbox(
                                  value: cnr.isChecked,
                                  onChanged: (value) => cnr.toggleCheckbox(),
                                ),
                              ],
                            ),
                            Container(
                              width: cnr.width,
                              height: cnr.height,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  AnimatedAlign(
                                    alignment: Alignment(cnr.xAlign, 0),
                                    duration: const Duration(milliseconds: 300),
                                    child: Container(
                                      width: cnr.width * 0.5,
                                      height: cnr.height,
                                      decoration: const BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await loginProvider.selectLang(
                                          "en", context);
                                    },
                                    child: Align(
                                      alignment: const Alignment(-1, 0),
                                      child: Container(
                                        width: cnr.width * 0.5,
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'English',
                                          style: TextStyle(
                                            color: cnr.englishColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await loginProvider.selectLang(
                                          "ar", context);
                                    },
                                    child: Align(
                                      alignment: const Alignment(1, 0),
                                      child: Container(
                                        width: cnr.width * 0.5,
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'عربي',
                                          style: TextStyle(
                                            color: cnr.arabicColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
    );
  }
}

class Mytext extends StatelessWidget {
<<<<<<< HEAD
  Mytext({
=======
  final String text;
  final double fonstSize;

  const Mytext({
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
    super.key,
    required this.text,
    required this.fonstSize,
  });
<<<<<<< HEAD
  String text;
  double fonstSize;
=======

>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: fonstSize),
    );
  }
}

class MyTextField extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscure;
  final double? iconeSize;
  final double? textfontSize;
<<<<<<< HEAD
=======

>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
  const MyTextField({
    super.key,
    this.icon,
    this.hintText,
    this.controller,
    this.obscure = false,
<<<<<<< HEAD
    InputDecoration? decoration,
    required this.iconeSize,
    required this.textfontSize,
  });
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    return null;
  }
=======
    required this.iconeSize,
    required this.textfontSize,
  });
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black, fontSize: textfontSize),
      controller: controller,
      obscureText: obscure!,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.brown),
        prefixIcon: Icon(
          icon,
          size: iconeSize,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
<<<<<<< HEAD
  Function()? ontap;
  String text;
  double? fontSize;
  double? height;
  double? width;
  MyButton(
      {super.key,
      required this.fontSize,
      this.ontap,
      required this.text,
      required this.height,
      required this.width,
      ButtonStyle? style});
=======
  final Function()? ontap;
  final String text;
  final double? fontSize;
  final double? height;
  final double? width;

  const MyButton({
    super.key,
    required this.fontSize,
    this.ontap,
    required this.text,
    required this.height,
    required this.width,
  });
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
<<<<<<< HEAD

// class ToggleButton extends StatefulWidget {
//   @override
//   _ToggleButtonState createState() => _ToggleButtonState();
// }

// const double width = 300.0;
// const double height = 60.0;
// const double loginAlign = -1;
// const double signInAlign = 1;
// const Color selectedColor = Colors.white;
// const Color normalColor = Colors.black54;

// class _ToggleButtonState extends State<ToggleButton> {
//   late double xAlign;
//   late Color loginColor;
//   late Color signInColor;

//   @override
//   void initState() {
//     super.initState();
//     xAlign = loginAlign;
//     loginColor = selectedColor;
//     signInColor = normalColor;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Demo'),
//       ),
//       body: Center(
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.all(
//               Radius.circular(50.0),
//             ),
//           ),
//           child: Stack(
//             children: [
//               AnimatedAlign(
//                 alignment: Alignment(xAlign, 0),
//                 duration: Duration(milliseconds: 300),
//                 child: Container(
//                   width: width * 0.5,
//                   height: height,
//                   decoration: BoxDecoration(
//                     color: Colors.lightGreen,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(50.0),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     xAlign = loginAlign;
//                     loginColor = selectedColor;

//                     signInColor = normalColor;
//                   });
//                 },
//                 child: Align(
//                   alignment: Alignment(-1, 0),
//                   child: Container(
//                     width: width * 0.5,
//                     color: Colors.transparent,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                         color: loginColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     xAlign = signInAlign;
//                     signInColor = selectedColor;

//                     loginColor = normalColor;
//                   });
//                 },
//                 child: Align(
//                   alignment: Alignment(1, 0),
//                   child: Container(
//                     width: width * 0.5,
//                     color: Colors.transparent,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Signin',
//                       style: TextStyle(
//                         color: signInColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
=======
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
