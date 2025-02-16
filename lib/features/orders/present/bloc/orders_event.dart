import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/create_order_req_body.dart';
part 'orders_event.freezed.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.getOrders() = _GetOrders;
    const factory OrdersEvent.pickImage({
    required ImageSource source,
    required CaptureType type,
  }) = _PickImage;

  const factory OrdersEvent.pickVideo({
    required ImageSource source,
  }) = _PickVideo;
  const factory OrdersEvent.createOrder({
    required CreateOrderReqBody createOrderReqBody,
  }) = _CreateOrder;
}
enum CaptureType { imageOne, imageTwo ,}
