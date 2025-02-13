// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../core/helper/routes.dart';
// import '../../../../core/helper/storage.dart';
// import '../../../../temporary/controller/auth_controller.dart';

// class LoginController {
//   Future<Map<String, dynamic>> login(String? email, String? password) async {
//     http.Response response = await http.post(
//       Uri.parse(api['login']!),
//       body: {
//         'email': email.toString(),
//         'password': password.toString(),
//       },
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);

//       return data;
//     }

//     throw Exception(response.reasonPhrase);
//   }

//   Future<Map<String, dynamic>> signUp(
//     String name,
//     String address,
//     String phone,
//     String email,
//     String password,
//     String passwordConfirmation,
//     String? code,
//   ) async {
//     http.Response response = await http.post(
//       Uri.parse(api['register']!),
//       body: {
//         'email': email.toString(),
//         'password': password.toString(),
//         "name": name.toString(),
//         "address": address.toString(),
//         "phone": phone.toString(),
//         "password_confirmation": passwordConfirmation.toString(),
//         "code": code.toString(),
//       },
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);

//       return data;
//     }

//     throw Exception(response.reasonPhrase);
//   }

//   Future<Map<String, dynamic>> isLogedIn(String? token) async {
//     http.Response response = await http.post(
//       Uri.parse(api['check']!),
//       headers: await AuthController.getAuthHeaders(),
//     );
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       return data;
//     }

//     throw Exception(response.reasonPhrase);
//   }

//   static Future<Map<String, String>> getAuthHeaders() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ${prefs.getString('auth_token')}',
//       'Locale': Storage.getString('language') ?? 'ar'
//     };
//   }

//   Future<Map<String, dynamic>> resetPassword(String email) async {
//     http.Response response = await http.post(
//       Uri.parse(api["password"]["reset"]!),
//       body: {"email": email},
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);

//       return data;
//     }

//     throw Exception(response.reasonPhrase);
//   }

// }
