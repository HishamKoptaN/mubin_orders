import '../../../../core/networking/api_result.dart';
import '../../../../core/models/user_data.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../domain/repo/main_repo.dart';
import '../datasources/main_api.dart';
import 'package:injectable/injectable.dart' show Injectable;

@Injectable(
  as: MainRepo,
)
class MainRepoImpl implements MainRepo {
  final MainApi mainApi;
  MainRepoImpl({
    required this.mainApi,
  });
  @override
  Future<ApiResult<UserData>?> check() async {
    try {
      final response = await mainApi.check();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
