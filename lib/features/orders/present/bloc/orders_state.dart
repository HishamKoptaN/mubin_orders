import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/add_order_req_model.dart';
import '../../data/models/orders_res_model.dart';
import '../../domain/entities/add_order_req.dart';
part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _LoadInProgress;
  const factory OrdersState.success() = _Success;
  const factory OrdersState.loaded({
    required List<Order>? orders,
    required bool? hasMore,
    required AddOrderReq? addOrderReq,
    required String? uploadingProgress,
  }) = _Loaded;
  const factory OrdersState.getOrdersfailure({
    required ApiErrorModel apiErrorModel,
  }) = _GetOrdersFailure;
  const factory OrdersState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
