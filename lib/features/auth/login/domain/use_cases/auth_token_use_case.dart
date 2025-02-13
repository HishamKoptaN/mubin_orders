import '../../../../../core/models/user_data.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/login_req_body_model.dart';
import '../../data/repo_imp/login_repo_impl.dart';

class LoginUseCase {
  final LoginRepoImpl loginRepo;
  LoginUseCase({
    required this.loginRepo,
  });
  Future<ApiResult<UserData?>> authToken({
    required LoginReqBodyModel loginReqBodyModel,
  }) async {
    return await loginRepo.authToken(
      loginReqBodyModel: loginReqBodyModel,
    );
  }
}
