import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/models/user_data.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/firabase_login_req_body_model.dart';
import '../models/login_req_body_model.dart';
part 'login_api.g.dart';

class LoginRemDataSrc {
  final FirebaseAuth firebaseAuth;

  LoginRemDataSrc({
    required this.firebaseAuth,
  });
  Future<UserCredential> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) async {
    try {
      await firebaseAuth.currentUser?.reload();
      return await firebaseAuth.signInWithEmailAndPassword(
        email: firabaseLoginReqBodyModel.email ?? '',
        password: firabaseLoginReqBodyModel.password ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExistedAccountException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else {
        throw ServerException();
      }
    } catch (_) {
      throw ServerException();
    }
  }
}

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class LoginApi {
  factory LoginApi(
    Dio dio, {
    String baseUrl,
  }) = _LoginApi;

  @POST(
    ApiConstants.authToken,
  )
  Future<UserData> authToken({
    @Body() required LoginReqBodyModel loginReqBodyModel,
  });
}
