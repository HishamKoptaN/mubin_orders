// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_otp_req_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyPhoneOtpReqBodyModelImpl _$$VerifyPhoneOtpReqBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyPhoneOtpReqBodyModelImpl(
      verificationId: json['verificationId'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$VerifyPhoneOtpReqBodyModelImplToJson(
        _$VerifyPhoneOtpReqBodyModelImpl instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'otp': instance.otp,
    };
