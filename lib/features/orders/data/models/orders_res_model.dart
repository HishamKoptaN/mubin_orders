import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_res_model.freezed.dart';
part 'orders_res_model.g.dart';

@freezed
class OrdersResModel with _$OrdersResModel {
    const factory OrdersResModel({
        @JsonKey(name: "orders")
        List<Order>? orders,
        @JsonKey(name: "meta")
        Meta? meta,
    }) = _OrdersResModel;

    factory OrdersResModel.fromJson(Map<String, dynamic> json) => _$OrdersResModelFromJson(json);
}

@freezed
class Meta with _$Meta {
    const factory Meta({
        @JsonKey(name: "per_page")
        int? perPage,
        @JsonKey(name: "current_page")
        int? currentPage,
        @JsonKey(name: "last_page")
        int? lastPage,
        @JsonKey(name: "total_pages")
        int? totalPages,
        @JsonKey(name: "has_next_page")
        bool? hasNextPage,
        @JsonKey(name: "has_previous_page")
        bool? hasPreviousPage,
        @JsonKey(name: "total")
        int? total,
    }) = _Meta;

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Order with _$Order {
    const factory Order({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "latitude")
        String? latitude,
        @JsonKey(name: "longitude")
        String? longitude,
        @JsonKey(name: "image_one")
        String? imageOne,
        @JsonKey(name: "image_two")
        String? imageTwo,
        @JsonKey(name: "video")
        String? video,
        @JsonKey(name: "place")
        String? place,
        @JsonKey(name: "branch_id")
        int? branchId,
        @JsonKey(name: "client_id")
        int? clientId,
    }) = _Order;

    factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
