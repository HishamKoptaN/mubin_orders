import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_phone_otp_req_body_model.freezed.dart';
part 'verify_phone_otp_req_body_model.g.dart';

@freezed
class VerifyPhoneOtpReqBodyModel with _$VerifyPhoneOtpReqBodyModel {
  const factory VerifyPhoneOtpReqBodyModel({
    @JsonKey(name: "verificationId") String? verificationId,
    @JsonKey(name: "otp") String? otp,
  }) = _VerifyPhoneOtpReqBodyModel;

  factory VerifyPhoneOtpReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneOtpReqBodyModelFromJson(json);
}
