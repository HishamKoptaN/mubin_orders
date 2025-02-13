import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../helper/routes.dart';

class MainRepo {
  Future<Map<String, dynamic>> isLogedIn(String token) async {
    try {
      final response = await http
          .post(
            Uri.parse(api['check']!),
            headers: await getAuthHeaders(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Unauthorized');
      }
    } on TimeoutException catch (_) {
      throw Exception('Connection timeout');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Map<String, String>> getAuthHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('auth_token')}',
      // 'Locale':await SharedPrefHelper.getString(key: 'language')
    };
  }
}
