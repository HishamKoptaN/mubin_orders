import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/database/cache/shared_pref_helper.dart';
import '../../../../core/database/cache/shared_pref_keys.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../../../core/single_tone/user_singleton.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/errors/firebase_failures.dart';
import '../../data/models/login_req_body_model.dart';
import '../../domain/use_cases/login_use_cases.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:injectable/injectable.dart' show LazySingleton;

@LazySingleton()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCases loginUseCases;
  final FirebaseAuth firebaseAuth;
  LoginBloc({
    required this.loginUseCases,
    required this.firebaseAuth,
  }) : super(const LoginState.initial()) {
    on<LoginEvent>(
      (event, emit) async {
        await event.when(
          fireLogin: (
            firabaseLoginReqBodyModel,
          ) async {
            emit(
              const LoginState.loading(),
            );
            final result = await loginUseCases.firebaseLogin(
              firabaseLoginReqBodyModel: firabaseLoginReqBodyModel,
            );
            await result.fold(
              (firebaseFailure) {
                emit(
                  LoginState.failure(
                    apiErrorModel: mapFailureToError(
                      firebaseFailure: firebaseFailure,
                    ),
                  ),
                );
              },
              (userCredential) async {
                await userCredential.user?.getIdToken().then(
                  (idToken) async {
                    log(idToken!);
                    final res = await loginUseCases.authToken(
                      loginReqBodyModel: const LoginReqBodyModel().copyWith(
                        idToken: idToken,
                      ),
                    );
                    await res.when(
                      success: (
                        res,
                      ) async {
                        UserDataSingleton.instance.user = res;
                        await SharedPrefHelper.setSecuredString(
                          key: SharedPrefKeys.userToken,
                          value: res?.token ?? '',
                        );
                        await DioFactory.setTokenIntoHeaderAfterLogin(
                          token: res?.token ?? '',
                        );
                        emit(
                          const LoginState.success(),
                        );
                      },
                      failure: (
                        apiErrorModel,
                      ) async {
                        emit(
                          LoginState.failure(
                            apiErrorModel: apiErrorModel,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  ApiErrorModel mapFailureToError({
    required FirebaseFailure firebaseFailure,
  }) {
    if (firebaseFailure is ExistedAccountFailure) {
      return ApiErrorModel(error: 'Account already exists');
    } else if (firebaseFailure is WrongPasswordFailure) {
      return ApiErrorModel(error: 'Incorrect password');
    } else if (firebaseFailure is OfflineFailure) {
      return ApiErrorModel(error: 'No internet connection');
    } else {
      return ApiErrorModel(error: 'Unknown error occurred');
    }
  }
}
