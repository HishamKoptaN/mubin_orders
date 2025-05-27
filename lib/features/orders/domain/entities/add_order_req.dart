import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_order_req.freezed.dart';

@freezed
class AddOrderReq with _$AddOrderReq {
  const factory AddOrderReq({
    String? clientNumber,
    String? placeName,
    File? video,
    File? imageOne,
    File? imageTwo,
    String? latitude,
    String? longitude,
  }) = _AddOrderReq;
  static AddOrderReq empty() => const AddOrderReq();
}
extension AddOrderReqValidation on AddOrderReq {
  bool get isComplete {
    return clientNumber?.isNotEmpty == true &&
        placeName?.isNotEmpty == true &&
        video != null &&
        imageOne != null &&
        imageTwo != null;
  }
}
