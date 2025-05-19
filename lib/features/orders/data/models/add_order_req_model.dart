import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_order_req_model.freezed.dart';
part 'add_order_req_model.g.dart';

@freezed
class AddOrderReqModel with _$AddOrderReqModel {
  const factory AddOrderReqModel({
    @JsonKey(name: "clientId") String? clientId,
    @JsonKey(name: "placeName") String? placeName,
    @JsonKey(ignore: true) File? video,
    @JsonKey(ignore: true) File? imageOne,
    @JsonKey(ignore: true) File? imageTwo,
    @JsonKey(name: "latitude") String? latitude,
    @JsonKey(name: "longitude") String? longitude,
  }) = _AddOrderReqModel;

  factory AddOrderReqModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrderReqModelFromJson(json);

  static AddOrderReqModel empty() => const AddOrderReqModel();
}

extension AddOrderReqModelValidation on AddOrderReqModel {
  bool get isComplete {
    return clientId?.isNotEmpty == true &&
        placeName?.isNotEmpty == true &&
        video != null &&
        imageOne != null &&
        imageTwo != null;
  }
}
