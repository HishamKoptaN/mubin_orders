import '../../../features/auth/login/present/bloc/login_bloc.dart';
import '../../../features/main/present/bloc/main_bloc.dart';
import '../../../features/orders/present/bloc/orders_bloc.dart';
import '../dependency_injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<MainBloc>(
        () => MainBloc(
          auth: getIt(),
        ),
      )
      //! Login
      ..registerLazySingleton<LoginBloc>(
        () => LoginBloc(
          firebaseLoginUseCase: getIt(),
          loginUseCase: getIt(),
          firebaseAuth: getIt(),
        ),
      )
       //! Login
      ..registerLazySingleton<OrdersBloc>(
        () => OrdersBloc(
          getOrdersUseCase: getIt(),createOrderUseCase:getIt(),
        ),
      );
  }
}
