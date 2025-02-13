import '../../../features/auth/login/domain/use_cases/auth_token_use_case.dart';
import '../../../features/auth/login/domain/use_cases/fire_login_use_case.dart';
import '../../../features/main/domain/usecases/main_use_casees.dart';
import '../dependency_injection.dart';

class UseCaseModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton(
        () => MainUseCasess(
          mainRepo: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => LoginUseCase(
          loginRepo: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => FirebaseLoginUseCase(
          loginRepo: getIt(),
        ),
      );
  }
}
