import 'dart:io';
import 'package:dio/dio.dart';
import '../../domain/entities/add_order_req.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_order_req_model.freezed.dart';

@freezed
class AddOrderReqModel with _$AddOrderReqModel {
  const AddOrderReqModel._();
  const factory AddOrderReqModel({
    @JsonKey(name: "client_number") String? clientNumber,
    @JsonKey(name: "place_name") String? placeName,
    @JsonKey(ignore: true) File? video,
    @JsonKey(ignore: true) File? imageOne,
    @JsonKey(ignore: true) File? imageTwo,
    @JsonKey(name: "latitude") String? latitude,
    @JsonKey(name: "longitude") String? longitude,
  }) = _AddOrderReqModel;
  factory AddOrderReqModel.fromEntity(AddOrderReq entity) => AddOrderReqModel(
        clientNumber: entity.clientNumber,
        placeName: entity.placeName,
        video: entity.video,
        imageOne: entity.imageOne,
        imageTwo: entity.imageTwo,
        latitude: entity.latitude,
        longitude: entity.longitude,
      );
  FormData toFormData(ProgressCallback? onSendProgress) {
    return FormData.fromMap({
      'client_number': clientNumber ?? '0',
      'place_name': placeName ?? '',
      'latitude': latitude ?? '0.0',
      'longitude': longitude ?? '0.0',
      'video': video != null ? MultipartFile.fromFileSync(video!.path) : null,
      'imageOne':
          imageOne != null ? MultipartFile.fromFileSync(imageOne!.path) : null,
      'imageTwo':
          imageTwo != null ? MultipartFile.fromFileSync(imageTwo!.path) : null,
    });
  }
}
