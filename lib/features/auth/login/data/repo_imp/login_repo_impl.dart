import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/models/user_data.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/network_info.dart';
import '../../../../errors/api_error_handler.dart';
import '../../../../errors/exceptions.dart';
import '../../../../errors/firebase_failures.dart';
import '../../domain/repo/login_repo.dart';
import '../data_sources/login_api.dart';
import '../models/firabase_login_req_body_model.dart';
import '../models/login_req_body_model.dart';
import '../models/verify_phone_otp_req_body_model.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRemDataSrc loginRemDataSrc;
  LoginApi loginApi;
  NetworkInfo networkInfo;
  FirebaseAuth firebaseAuth;
  LoginRepoImpl({
    required this.loginRemDataSrc,
    required this.loginApi,
    required this.networkInfo,
    required this.firebaseAuth,
  });
  @override
  Future<Either<FirebaseFailure, UserCredential>> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) async {
    try {
      final userCredential = await loginRemDataSrc.firebaseLogin(
        firabaseLoginReqBodyModel: firabaseLoginReqBodyModel,
      );
      return Right(
        userCredential,
      );
    } on ExistedAccountException {
      return Left(
        ExistedAccountFailure(),
      );
    } on WrongPasswordException {
      return Left(
        WrongPasswordFailure(),
      );
    } on ServerException {
      return Left(
        ServerFailure(),
      );
    }
  }

  @override
  Future<ApiResult<UserData>> authToken({
    required LoginReqBodyModel loginReqBodyModel,
  }) async {
    try {
      final response = await loginApi.authToken(
        loginReqBodyModel: loginReqBodyModel,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(error: error),
      );
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> logOut() async {
    if (await networkInfo.isConnected) {
      try {
        // GoogleSignIn googleSignIn = GoogleSignIn();
        // await googleSignIn.signOut();
        // await FirebaseAuth.instance.signOut();
        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
