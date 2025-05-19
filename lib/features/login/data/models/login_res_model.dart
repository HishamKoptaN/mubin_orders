import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_res_model.freezed.dart';
part 'login_res_model.g.dart';

@freezed
class LoginResModel with _$LoginResModel {
  const factory LoginResModel({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "additional_data") dynamic additionalData,
  }) = _LoginResModel;
  factory LoginResModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResModelFromJson(json);
}
