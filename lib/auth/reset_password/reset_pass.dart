// import 'package:flutter/material.dart';

// import '../login_register/login_register_controller.dart';

// class ResetPass extends StatefulWidget {
//   const ResetPass({Key? key}) : super(key: key);

//   @override
//   State<ResetPass> createState() => _ResetPassState();
// }

// class _ResetPassState extends State<ResetPass> {
//   @override
//   Widget build(BuildContext context) {
//     UserDataController userDataController = UserDataController();
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             Center(
//               child: Image.asset(
//                 'assets/lock.png',
//                 height: 200,
//                 width: 200,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Reset Password',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Please enter your google email to receive password reset link ',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 15,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             MyTextField(
//               hintText: 'Email',
//               icon: Icons.email_outlined,
//               controller: userDataController.emailPassResetController,
//               labelText: '',
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   userDataController.passwordReset();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.amber,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 100),
//                 ),
//                 child: const Text('Send Link', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyTextField extends StatelessWidget {
//   final IconData? icon;
//   final String? hintText;
//   final TextEditingController? controller;
//   final bool? obscure;

//   const MyTextField({
//     super.key,
//     this.icon,
//     this.hintText,
//     this.controller,
//     this.obscure = false,
//     InputDecoration? decoration,
//     required String labelText,
//   });
//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email address';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         style: const TextStyle(color: Colors.black),
//         controller: controller,
//         obscureText: obscure!,
//         decoration: InputDecoration(
//           labelStyle: TextStyle(color: Colors.brown),
//           prefixIcon: Icon(
//             icon,
//             size: 28,
//             color: Colors.black,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           fillColor: Colors.white,
//           filled: true,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//         ),
//       ),
//     );
//   }
// }
