import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../features/login/data/data_sources/login_api.dart';
import '../../features/main/data/datasources/main_api.dart';
import '../../features/orders/data/datasources/orders_api.dart';
import '../networking/network_info.dart';

@module
abstract class InjectionModule {
  InjectionModule() {
    log("InjectionModule has been initialized! 🚀");
  }
  @lazySingleton
  InternetConnection get connectionChecker => InternetConnection();
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @lazySingleton
  NetworkInfo networkInfo(NetworkInfoImpl impl) => impl;
  @lazySingleton
  NetworkInfoImpl networkInfoImpl(InternetConnection connectionChecker) =>
      NetworkInfoImpl(connectionChecker: connectionChecker);
  @lazySingleton
  LoginRemDataSrc loginRemDataSrc(FirebaseAuth auth) =>
      LoginRemDataSrc(firebaseAuth: auth);
  //! MainApi
  @lazySingleton
  MainApi mainApi(Dio dio) => MainApi(
        dio,
      );
  //! LoginApi
  @lazySingleton
  LoginApi loginApi(Dio dio) => LoginApi(
        dio,
      );
  //! OrdersApi
  @lazySingleton
  OrdersApi ordersApi(Dio dio) => OrdersApi(
        dio,
      );
}
