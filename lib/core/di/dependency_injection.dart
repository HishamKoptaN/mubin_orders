import 'package:get_it/get_it.dart';
import 'modules/api_module.dart';
import 'modules/bloc_module.dart';
import 'modules/repo_module.dart';
import 'modules/uses_case_module.dart';

final getIt = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
    await UseCaseModule().provides();
  }
}
