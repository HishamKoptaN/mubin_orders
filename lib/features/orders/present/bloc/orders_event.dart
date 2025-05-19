import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_order_req_model.dart';
part 'orders_event.freezed.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.getOrders() = _GetOrders;
  const factory OrdersEvent.updateData({
    required AddOrderReqModel addOrderReqModel,
  }) = _UpdateData;
  const factory OrdersEvent.createOrder() = _CreateOrder;
}

enum FileType {
  image,
  video,
}
