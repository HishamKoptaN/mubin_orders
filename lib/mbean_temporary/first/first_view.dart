// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// import '../../app/login/login_controller.dart';
// import '../../app/login/login_view.dart';

// LoginController userDataController = LoginController();

// class Authenticate extends StatefulWidget {
//   const Authenticate({super.key});
//   @override
//   State<Authenticate> createState() => _AuthenticateState();
// }

// class _AuthenticateState extends State<Authenticate> {
//   SharedPreferences? sharedPref;
//   bool showWhat = false;

//   @override
//   void initState() {
//     super.initState();
//     _initialize();
//   }

//   void _initialize() async {
//     sharedPref = await SharedPreferences.getInstance();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) {
//         if (FirebaseAuth.instance.currentUser != null) {
//           Get.to(const Biometric());
//         }
//         setState(
//           () {
//             showWhat = true;
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           }
//           return snapshot.hasData ? const Biometric() : const LoginView();
//         },
//       ),
//     );
//   }
// }

// class Second extends StatefulWidget {
//   const Second({super.key});

//   @override
//   State<Second> createState() => _SecondState();
// }

// class _SecondState extends State<Second> {
//   SharedPreferences? sharedPref;
//   bool showWhat = false;

//   @override
//   void initState() {
//     super.initState();
//     _initialize();
//   }

//   void _initialize() async {
//     sharedPref = await SharedPreferences.getInstance();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) {
//         if (FirebaseAuth.instance.currentUser != null) {
//           Get.to(const Biometric());
//         }
//         setState(
//           () {
//             showWhat = true;
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           }
//           return snapshot.hasData ? const Biometric() : const LoginView();
//         },
//       ),
//     );
//   }
// }

// class Biometric extends StatelessWidget {
//   const Biometric({super.key});

//   @override
//   Widget build(BuildContext context) {
//     userDataController.authenticateWithBiometrics();
//     return const Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Center(),
//     );
//   }
// }
