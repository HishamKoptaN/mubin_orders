// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderReqBodyImpl _$$CreateOrderReqBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderReqBodyImpl(
      content: json['content'] as String?,
      imageUrl: json['image_url'] as String?,
      videoUrl: json['video_url'] as String?,
    );

Map<String, dynamic> _$$CreateOrderReqBodyImplToJson(
        _$CreateOrderReqBodyImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'image_url': instance.imageUrl,
      'video_url': instance.videoUrl,
    };
