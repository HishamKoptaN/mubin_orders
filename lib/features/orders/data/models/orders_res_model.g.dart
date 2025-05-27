// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersResModelImpl _$$OrdersResModelImplFromJson(Map<String, dynamic> json) =>
    _$OrdersResModelImpl(
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrdersResModelImplToJson(
        _$OrdersResModelImpl instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'meta': instance.meta,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      perPage: (json['per_page'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      hasNextPage: json['has_next_page'] as bool?,
      hasPreviousPage: json['has_previous_page'] as bool?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'total_pages': instance.totalPages,
      'has_next_page': instance.hasNextPage,
      'has_previous_page': instance.hasPreviousPage,
      'total': instance.total,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num?)?.toInt(),
      orderNumber: json['order_number'] as String?,
      place: json['place'] as String?,
      video: json['video'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      imageOne: json['image_one'] as String?,
      imageTwo: json['image_two'] as String?,
      updatedAt: json['updated_at'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      branchId: (json['branch_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'place': instance.place,
      'video': instance.video,
      'thumbnail_url': instance.thumbnailUrl,
      'image_one': instance.imageOne,
      'image_two': instance.imageTwo,
      'updated_at': instance.updatedAt,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'branch_id': instance.branchId,
      'created_at': instance.createdAt,
    };
