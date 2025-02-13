import '../../../../core/networking/api_result.dart';
import '../../../../core/models/user_data.dart';

abstract class MainRepo {
  Future<ApiResult<UserData>?> check();
}
