import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../database/cache/shared_pref_helper.dart';
import '../database/cache/shared_pref_keys.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Future<Dio> setupDio() async {
    Duration timeOut = const Duration(
      seconds: 60,
    );
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(
            key: SharedPrefKeys.userToken,
          )}',
        };
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static Future<void> setTokenIntoHeaderAfterLogin({
    required String token,
  }) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(
        key: SharedPrefKeys.userToken,
      )}',
    };
  }
}
