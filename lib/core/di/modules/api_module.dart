import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../../features/auth/login/data/data_sources/login_api.dart';
import '../../../features/main/data/datasources/main_api.dart';
import '../../../features/orders/data/datasources/orders_api.dart';
import '../../networking/dio_factory.dart';
import '../../networking/network_info.dart';
import '../dependency_injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = await DioFactory.setupDio();
    getIt
      //! dio
      ..registerSingleton(dio)
      ..registerLazySingleton<InternetConnection>(
        () => InternetConnection(),
      )
      ..registerLazySingleton<FirebaseAuth>(
        () => FirebaseAuth.instance,
      )
      //! MainApi
      ..registerLazySingleton<MainApi>(
        () => MainApi(
          getIt(),
        ),
      )
      //! InternetConnection
      ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(
          connectionChecker: getIt(),
        ),
      )
      ..registerLazySingleton<LoginRemDataSrc>(
        () => LoginRemDataSrc(
          firebaseAuth: getIt(),
        ),
      )
      //! LoginApi
      ..registerLazySingleton<LoginApi>(
        () => LoginApi(getIt<Dio>()),
      ) //! LoginApi
      ..registerLazySingleton<OrdersApi>(
        () => OrdersApi(getIt()),
      )  ;
  }
}
