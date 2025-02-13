import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_phone_number_req_body_model.freezed.dart';
part 'verify_phone_number_req_body_model.g.dart';

@freezed
class VerifyPhoneNumberReqBodyModel with _$VerifyPhoneNumberReqBodyModel {
  const factory VerifyPhoneNumberReqBodyModel({
    @JsonKey(name: "phoneNumber") String? phoneNumber,
  }) = _VerifyPhoneNumberReqBodyModel;

  factory VerifyPhoneNumberReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneNumberReqBodyModelFromJson(json);
}
