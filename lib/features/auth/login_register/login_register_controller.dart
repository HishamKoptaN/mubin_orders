// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../app/navigator_bottom_bar/navigator_bottom_bar_view.dart';
// import 'login_register_view.dart';

// final LocalAuthentication auth = LocalAuthentication();

// class UserDataController extends GetxController {
//   String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
//   TextEditingController loginEmailController = TextEditingController();
//   TextEditingController loginPassController = TextEditingController();
//   late final currentUser = FirebaseAuth.instance.currentUser;
//   TextEditingController registerNamelController = TextEditingController();
//   TextEditingController registerEmailController = TextEditingController();
//   TextEditingController registerPasswordController = TextEditingController();
//   TextEditingController registerConfirmPasswordController =
//       TextEditingController();
//   TextEditingController registerPhoneNumberController = TextEditingController();
//   TextEditingController emailPassResetController = TextEditingController();
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   static const String emailKey = 'email';
//   static const String passwordKey = 'password';
//   User? user = FirebaseAuth.instance.currentUser;
//   bool? showWhat;
//   bool firstTimeLogin = true;
//   bool registerIsExtended = false;
//   bool loginIsExtended = false;
//   bool firstTime = false;
//   final RxBool isChecked = RxBool(false);
//   void showRegister() {
//     registerIsExtended = true;

//     update();
//   }

//   void hideRegister() {
//     registerIsExtended = false;

//     update();
//   }

//   void toggleCheckbox() {
//     isChecked.value = !isChecked.value; // Update using value property
//     update(); // Inform GetX about the change
//   }

//   void changePassword() async {
//     User user = FirebaseAuth.instance.currentUser!;
//     if (newPasswordController.text == confirmPasswordController.text) {
//       try {
//         await user.updatePassword(newPasswordController.text);
//       } catch (error) {
//         if (kDebugMode) {
//           print(error);
//         }
//       }
//     }
//   }

//   Future<void> authenticateWithBiometrics() async {
//     bool authenticated = false;
//     try {
//       authenticated = await auth.authenticate(
//         localizedReason:
//             'Scan your fingerprint (or face or whatever) to authenticate',
//         options: const AuthenticationOptions(
//           stickyAuth: true,
//           biometricOnly: true,
//         ),
//       );

//       if (authenticated) {
//         WidgetsFlutterBinding.ensureInitialized();
//         Get.to(const NavigateBarScreen());
//       } else {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.remove('password');
//       }
//     } on PlatformException {
//       firstTime = false;
//       return;
//     }
//   }

//   void signOut() async {
//     await FirebaseAuth.instance.signOut();
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('email');
//     prefs.remove('password');
//     Get.off(const LoginView());
//   }

//   Future<void> signIn() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: loginEmailController.value.text.trim(),
//         password: loginPassController.value.text.trim(),
//       );
//       if (isChecked.value) {
//         prefs.setString('email', loginEmailController.value.text.trim());
//         prefs.setString('password', loginPassController.value.text.trim());
//       } else if (!isChecked.value) {
//         prefs.remove('email');
//         prefs.remove('password');
//       }
//       Get.to(const NavigateBarScreen());

//       Get.snackbar(
//         'Success',
//         '',
//         colorText: Colors.black,
//         backgroundColor: Colors.white,
//         margin: const EdgeInsets.all(15),
//         icon: const Icon(
//           Icons.message,
//           color: Colors.black,
//         ),
//         messageText: const Text(
//           'Success Logged in',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.black,
//           ), // زيادة حجم الخط هنا
//         ),
//       );
//     } on FirebaseAuthException {
//       Get.snackbar(
//         'Faild',
//         '',
//         colorText: Colors.black,
//         backgroundColor: Colors.white,
//         margin: const EdgeInsets.all(15),
//         icon: const Icon(
//           Icons.message,
//           color: Colors.black,
//         ),
//         messageText: const Text(
//           'Try Again',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//       );
//     }
//   }

//   Future<void> loadSavedData() async {
//     SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     loginEmailController.text = sharedPref.getString('email') ?? '';
//     loginPassController.text = sharedPref.getString('password') ?? '';
//   }

//   Future<void> clearCredentials() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('email');
//     prefs.remove('password');
//     update();
//   }

//   void signUp() async {
//     if (registerPasswordController.text !=
//         registerConfirmPasswordController.text) {
//       return;
//     }

//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: registerEmailController.text.trim(),
//               password: registerPasswordController.text.trim());
//       FirebaseFirestore.instance
//           .collection("users")
//           .doc(userCredential.user!.email)
//           .set(
//         {
//           'email': registerEmailController.text.split('@')[0],
//           'Name': registerNamelController.text,
//           'phone_number': registerPhoneNumberController.text,
//           'sign_Up_date': FieldValue.serverTimestamp(),
//         },
//       );
//       Get.to(const NavigateBarScreen());
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         '$e ',
//         snackStyle: SnackStyle.FLOATING,
//         backgroundColor: Colors.amber,
//         margin: const EdgeInsets.all(15),
//         icon: const Icon(
//           Icons.message,
//           color: Colors.black,
//           size: 25,
//         ),
//         messageText: const Text(
//           'Failed Login',
//           style: TextStyle(fontSize: 20),
//         ),
//       );
//     }
//   }

//   Future<void> passwordReset() async {
//     try {
//       await FirebaseAuth.instance
//           .sendPasswordResetEmail(email: emailPassResetController.text);
//       Get.snackbar(
//         'successfully',
//         '',
//         snackStyle: SnackStyle.FLOATING,
//         backgroundColor: Colors.amber,
//         margin: const EdgeInsets.all(15),
//         icon: const Icon(
//           Icons.message,
//           color: Colors.black,
//           size: 25,
//         ),
//         messageText: const Text(
//           'Email sent successfully',
//           style: TextStyle(fontSize: 20),
//         ),
//       );
//     } on FirebaseAuthException {
//       Get.snackbar(
//         'Failed',
//         '',
//         snackStyle: SnackStyle.FLOATING,
//         backgroundColor: Colors.amber,
//         margin: const EdgeInsets.all(15),
//         icon: const Icon(
//           Icons.message,
//           color: Colors.black,
//           size: 25,
//         ),
//         messageText: const Text(
//           'Failed to send email',
//           style: TextStyle(fontSize: 20),
//         ),
//       );
//     }
//   }

//   void phoneAuth() async {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '201120332361',
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {},
//       codeSent: (String verificationId, int? resendToken) async {
//         String smsCode = 'xxxx';
//         PhoneAuthCredential credential = PhoneAuthProvider.credential(
//             verificationId: verificationId, smsCode: smsCode);
//         await auth.signInWithCredential(credential);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
// }
