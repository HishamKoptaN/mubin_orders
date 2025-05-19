// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResModelImpl _$$LoginResModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginResModelImpl(
      token: json['token'] as String?,
      role: json['role'] as String?,
      additionalData: json['additional_data'],
    );

Map<String, dynamic> _$$LoginResModelImplToJson(_$LoginResModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
      'additional_data': instance.additionalData,
    };
