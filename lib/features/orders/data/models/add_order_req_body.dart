import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_order_req_body.freezed.dart';
part 'add_order_req_body.g.dart';

@freezed
class CreateOrderReqBody with _$AddOrderReqBody {
  const factory CreateOrderReqBody({
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "video_url") String? videoUrl,
  }) = _AddOrderReqBody;

  factory CreateOrderReqBody.fromJson(Map<String, dynamic> json) =>
      _$AddOrderReqBodyFromJson(json);
}
