import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/errors/api_error_model.dart';
import 'orders_event.dart';
part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _LoadInProgress;
  const factory OrdersState.success() = _Success;
  const factory OrdersState.filePicked({
    required XFile file,
    required FileType fileType,
    ImageSelection? imageSelection,
  }) = _ImagePicked;
  const factory OrdersState.uploading({
    required String progress,
  }) = _Uploading;
  
  const factory OrdersState.getOrdersfailure({
    required ApiErrorModel apiErrorModel,
  }) = _GetOrdersFailure;
   const factory OrdersState.pickFileFailure({
    required ApiErrorModel apiErrorModel,
  }) = _PickFileailure;
   const factory OrdersState.createOrderFailure({
    required ApiErrorModel apiErrorModel,
  }) = _CreateOrderFailure;
}
