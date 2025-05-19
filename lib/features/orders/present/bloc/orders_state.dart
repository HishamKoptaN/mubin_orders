import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/add_order_req_model.dart';
import '../../data/models/orders_res_model.dart';
import 'orders_event.dart';
part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _LoadInProgress;
  const factory OrdersState.success() = _Success;
  const factory OrdersState.loaded({
    required List<Order>? orders,
    required bool? hasMore,
    required AddOrderReqModel? addOrderReqModel,
    required String? uploadingProgress,
  }) = _Loaded;
  const factory OrdersState.getOrdersfailure({
    required ApiErrorModel apiErrorModel,
  }) = _GetOrdersFailure;
  const factory OrdersState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
