// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderReqBodyImpl _$$CreateOrderReqBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderReqBodyImpl(
      clientId: (json['client_id'] as num?)?.toInt(),
      place: json['place'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      video: json['video'] as String?,
      imageOne: json['image_one'] as String?,
      imageTwo: json['image_two'] as String?,
    );

Map<String, dynamic> _$$CreateOrderReqBodyImplToJson(
        _$CreateOrderReqBodyImpl instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'place': instance.place,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'video': instance.video,
      'image_one': instance.imageOne,
      'image_two': instance.imageTwo,
    };
