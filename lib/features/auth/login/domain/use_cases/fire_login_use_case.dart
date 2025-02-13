import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../errors/firebase_failures.dart';
import '../../data/models/firabase_login_req_body_model.dart';
import '../../data/repo_imp/login_repo_impl.dart';

class FirebaseLoginUseCase {
  final LoginRepoImpl loginRepo;
  FirebaseLoginUseCase({
    required this.loginRepo,
  });

  Future<Either<FirebaseFailure, UserCredential>> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) async {
    return await loginRepo.firebaseLogin(
      firabaseLoginReqBodyModel: firabaseLoginReqBodyModel,
    );
  }
}
