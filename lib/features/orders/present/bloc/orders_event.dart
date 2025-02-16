import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/all_imports.dart';
part 'orders_event.freezed.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.getOrders() = _GetOrders;
   const factory OrdersEvent.pickFile({
    required BuildContext context,
  required FileType fileType, 
  ImageSelection? imageSelection,
}) = _PickFile;
  const factory OrdersEvent.createOrder({
    required FormData formData,
  }) = _CreateOrder;
}
enum FileType { image, video, 
}

enum ImageSelection { first, second ,
}
