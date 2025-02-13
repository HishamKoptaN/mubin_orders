import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../errors/api_error_model.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success() = _Success;
  const factory LoginState.linkSent() = _LinkSent;
  const factory LoginState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
