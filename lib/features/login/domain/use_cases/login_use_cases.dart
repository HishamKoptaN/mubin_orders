import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/firebase_failures.dart';
import '../../data/models/firabase_login_req_body_model.dart';
import '../../../../core/models/user_data.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/login_req_body_model.dart';
import 'package:injectable/injectable.dart' show lazySingleton;
import '../repo/login_repo.dart';

@lazySingleton
class LoginUseCases {
  final LoginRepo loginRepo;
  LoginUseCases({
    required this.loginRepo,
  });
  Future<Either<FirebaseFailure, UserCredential>> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) async {
    return await loginRepo.firebaseLogin(
      firabaseLoginReqBodyModel: firabaseLoginReqBodyModel,
    );
  }

  Future<ApiResult<UserData?>> authToken({
    required LoginReqBodyModel loginReqBodyModel,
  }) async {
    return await loginRepo.authToken(
      loginReqBodyModel: loginReqBodyModel,
    );
  }
}
