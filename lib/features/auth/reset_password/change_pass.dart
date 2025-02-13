// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../login_register/login_register_controller.dart';

// UserDataController userDataController = UserDataController();

// class ChangePass extends StatelessWidget {
//   const ChangePass({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.amber,
//       body: Stack(
//         children: [
//           const Positioned(
//             child: SizedBox(
//               height: double.infinity,
//             ),
//           ),
//           Container(
//             width: MediaQuery.sizeOf(context).width,
//             height: 2 * MediaQuery.sizeOf(context).height / 3,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(9999),
//                 bottomRight: Radius.circular(9999),
//               ),
//               color: Colors.black,
//             ),
//           ),
//           Positioned(
//             top: MediaQuery.sizeOf(context).height / 4,
//             left: 20,
//             child: Container(
//               width: MediaQuery.sizeOf(context).width / 1.1,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Text(
//                       'Your New Password Must Be  Differnt from Previously Used  Passwords',
//                       style: GoogleFonts.cairo(
//                           color: Colors.amber,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   MyInputField(
//                     hintText: 'New Password',
//                     icon: Icons.lock_outline,
//                     controller: userDataController.newPasswordController,
//                     onChanged: (value) {},
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   MyInputField(
//                     hintText: 'Confirm Password',
//                     icon: Icons.lock_outline,
//                     controller: userDataController.confirmPasswordController,
//                     onChanged: (value) {},
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       userDataController.changePassword();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.amber,
//                       padding: const EdgeInsets.symmetric(horizontal: 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text(
//                       'Save',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MyInputField extends StatefulWidget {
//   TextEditingController? controller;
//   final String? hintText;

//   Text? label;
//   double? textfontSize;
//   MyInputField({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.textfontSize,
//     IconData? icon,
//     InputDecoration? decoration,
//     this.label,
//     required Function(dynamic value) onChanged,
//   });

//   @override
//   State<MyInputField> createState() => _MyInputFieldState();
// }

// class _MyInputFieldState extends State<MyInputField> {
//   MyInputField inputField = MyInputField(
//     onChanged: (value) {},
//   );
//   IconData? icon;
//   double? textfontSize;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         style: TextStyle(
//             color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
//         controller: widget.controller,
//         decoration: InputDecoration(
//           label: widget.label,
//           suffixStyle: const TextStyle(color: Colors.black),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           fillColor: Colors.white,
//           filled: true,
//           hintText: widget.hintText,
//           hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
//         ),
//       ),
//     );
//   }
// }
