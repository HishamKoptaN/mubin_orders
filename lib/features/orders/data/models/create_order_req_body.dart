import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_order_req_body.freezed.dart';
part 'create_order_req_body.g.dart';

@freezed
class CreateOrderReqBody with _$CreateOrderReqBody {
  const factory CreateOrderReqBody({
    @JsonKey(name: "client_id") int? clientId,
    @JsonKey(name: "place") String? place,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "video") String? video,
    @JsonKey(name: "image_one") String? imageOne,
    @JsonKey(name: "image_two") String? imageTwo,
  }) = _CreateOrderReqBody;

  factory CreateOrderReqBody.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderReqBodyFromJson(json);
}