import '../../../../core/models/user_data.dart';
import 'package:injectable/injectable.dart' show LazySingleton;
import '../../../../core/networking/api_result.dart';
import '../repo/main_repo.dart';

@LazySingleton()
class MainUseCasess {
  final MainRepo mainRepo;
  MainUseCasess({
    required this.mainRepo,
  });
  Future<ApiResult<UserData>?> check() async {
    return await mainRepo.check();
  }
}
