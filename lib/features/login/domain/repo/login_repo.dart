import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/models/user_data.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/errors/firebase_failures.dart';
import '../../data/models/firabase_login_req_body_model.dart';
import '../../data/models/login_req_body_model.dart';

abstract class LoginRepo {
  Future<Either<FirebaseFailure, UserCredential>> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  });
  Future<ApiResult<UserData?>> authToken({
    required LoginReqBodyModel loginReqBodyModel,
  });
  Future<Either<FirebaseFailure, Unit>> logOut();
}
