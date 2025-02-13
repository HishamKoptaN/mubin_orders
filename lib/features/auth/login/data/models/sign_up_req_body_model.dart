import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_req_body_model.freezed.dart';
part 'sign_up_req_body_model.g.dart';

@freezed
class SignUpReqBodyModel with _$SignUpReqBodyModel {
  const factory SignUpReqBodyModel({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
  }) = _SignUpReqBodyModel;
  factory SignUpReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpReqBodyModelFromJson(json);
}
