import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/add_order_req.dart';
part 'orders_event.freezed.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.getOrders() = _GetOrders;
  const factory OrdersEvent.updateData({
    required AddOrderReq addOrderReq,
  }) = _UpdateData;
  const factory OrdersEvent.createOrder() = _CreateOrder;
}
enum FileType {
  image,
  video,
}
