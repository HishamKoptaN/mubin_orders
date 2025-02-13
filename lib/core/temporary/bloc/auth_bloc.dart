// import 'dart:convert';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:local_auth/local_auth.dart';
// import '../../core/helper/storage.dart';
// import '../../features/main/main_model/main_model.dart';
// import '../controller/auth_controller.dart';
// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthController _authController = AuthController();

//   final LocalAuthentication auth = LocalAuthentication();

//   AuthBloc() : super(AuthInitial()) {
//     on<AuthLogin>(
//       (event, emit) async {
//         emit(AuthLoading());
//         final Map<String, dynamic> response = await _authController.login(
//           event.email,
//           event.password,
//         );
//         if (response['status']) {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String userJson = json.encode(response['user']);
//           prefs.setString('user', userJson);
//           Storage.setString(
//             'auth_token',
//             response['token'],
//           );
//           emit(
//             AuthLogedIn(),
//           );
//         } else {
//           emit(
//             AuthErrors(
//               message: response['error'],
//             ),
//           );
//         }
//       },
//     );

//     on<CheckEmailVerification>(
//       (event, emit) async {
//         emit(AuthLoading());
//         final Map<String, dynamic> response =
//             await _authController.getProfileUser();
//         if (response['status'] == true) {
//           User user = response['user'];
//           // if (user.emailVerifiedAt == null) {
//           //   emit(EmailNotVerify(user: user));
//           // } else if (user.emailVerifiedAt != null) {
//           //   emit(
//           //     EmailVerified(verified: false, message: response['error']),
//           //   );
//           // }
//         } else {
//           emit(
//             AuthErrors(
//               message: response['error'],
//             ),
//           );
//         }
//       },
//     );
//     on<AuthSignUp>(
//       (event, emit) async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         emit(AuthLoading());
//         final Map<String, dynamic> response = await _authController.signUp(
//           event.name,
//           event.address,
//           event.phone,
//           event.email,
//           event.password,
//           event.passwordConfirmation,
//           event.code,
//         );
//         if (response['status'] == true) {
//           Storage.setString('auth_token', response['token']);
//           String userJson = json.encode(response['user']);
//           prefs.setString('user', userJson);
//           emit(AuthLogedIn());
//         } else {
//           emit(AuthErrors(message: response['error']));
//         }
//       },
//     );

//     on<CompleteSignUp>(
//       (event, emit) async {
//         emit(AuthLoading());
//         final Map<String, dynamic> response =
//             await _authController.completeSignUp(
//           event.password,
//           event.passwordConfirmation,
//           event.code,
//         );
//         if (response['status'] == true) {
//           emit(SignUpCompleted());
//         } else {
//           emit(AuthErrors(message: response['error']));
//         }
//       },
//     );
//     on<CheckLogedIn>(
//       (event, emit) async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         String? token = prefs.getString('auth_token');
//         if (token == null) {
//           emit(AuthLogedOut());
//         } else {
//           final Map<String, dynamic> response =
//               await _authController.isLogedIn(token);
//           if (response['status'] == true) {
//             prefs.setString('user', json.encode(response['user']));
//             final bool canAuthenticate = await auth.canCheckBiometrics &&
//                 await auth.isDeviceSupported() &&
//                 prefs.getBool("fingerprints")!;
//             if (canAuthenticate) {
//               final bool didAuth = await auth.authenticate(
//                   localizedReason:
//                       'First Please authenticate to show access account');
//               if (didAuth) {
//                 emit(AuthLogedIn());
//               } else {
//                 emit(AuthErrors(message: "Error try again"));
//               }
//             } else {
//               emit(AuthLogedIn());
//             }
//           } else {
//             emit(AuthLogedOut());
//           }
//         }
//       },
//     );

//     on<ResetPassword>(
//       (event, emit) async {
//         final Map<String, dynamic> response =
//             await _authController.resetPassword(event.email);

//         if (response['status'] == true) {
//           emit(
//             ResetPassowrdEmailSent(
//               message: response['message'],
//             ),
//           );
//         } else {
//           emit(
//             AuthErrors(
//               message: response['error'],
//             ),
//           );
//         }
//       },
//     );

//     on<SignInWithGoogle>(
//       (event, emit) async {
//         emit(AuthLoading());
//         final Map<String, dynamic> response =
//             await _authController.signInWithGoogle(
//           event.email,
//           event.name,
//         );

//         if (response['status'] == true) {
//           Storage.setString('auth_token', response['token']);
//           emit(AuthLogedIn(createPassword: response['create_password']));
//         } else {
//           emit(EmailVerified(verified: true, message: response['error']));
//         }
//       },
//     );
//   }
// }
