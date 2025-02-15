import '../../../features/auth/login/data/repo_imp/login_repo_impl.dart';
import '../../../features/auth/login/domain/repo/login_repo.dart';
import '../../../features/main/data/repo_impl/main_repo_impl.dart';
import '../../../features/main/domain/repo/main_repo.dart';
import '../../../features/orders/data/repo_impl/orders_repo_impl.dart';
import '../../../features/orders/domain/repo/orders_repo.dart';
import '../dependency_injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<MainRepo>(
        () => MainRepoImpl(
          mainApi: getIt(),
        ),
      )
      //! Login
      ..registerLazySingleton<LoginRepo>(
        () => LoginRepoImpl(
          networkInfo: getIt(),
          loginRemDataSrc: getIt(),
          loginApi: getIt(),
          firebaseAuth: getIt(),
        ),
      )
      ..registerLazySingleton<LoginRepoImpl>(
        () => LoginRepoImpl(
          networkInfo: getIt(),
          loginRemDataSrc: getIt(),
          loginApi: getIt(),
          firebaseAuth: getIt(),
        ),
      ) ..registerLazySingleton<OrdersRepo>(
        () => OrdersRepoImpl(
          postsApi: getIt(),
        ),
      );
  }
}
