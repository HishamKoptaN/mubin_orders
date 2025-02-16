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
   const factory OrdersState.imagePicked({
    required XFile file,
   required FileType fileType, 
  ImageSelection? imageSelection,
  }) = _ImagePicked;
  const factory OrdersState.orderShare () = _OrderShare;
   const factory OrdersState.progress({required double progress,}) = _Progress;
  const factory OrdersState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}