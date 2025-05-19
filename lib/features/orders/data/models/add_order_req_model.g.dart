// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddOrderReqModelImpl _$$AddOrderReqModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddOrderReqModelImpl(
      clientId: json['clientId'] as String?,
      placeName: json['placeName'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$$AddOrderReqModelImplToJson(
        _$AddOrderReqModelImpl instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'placeName': instance.placeName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
