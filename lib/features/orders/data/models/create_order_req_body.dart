import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_order_req_body.freezed.dart';
part 'create_order_req_body.g.dart';

@freezed
class CreateOrderReqBody with _$CreateOrderReqBody {
  const factory CreateOrderReqBody({
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "video_url") String? videoUrl,
  }) = _CreateOrderReqBody;

  factory CreateOrderReqBody.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderReqBodyFromJson(json);
}
