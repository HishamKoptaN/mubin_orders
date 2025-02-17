import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_constants.dart';
import '../../data/models/orders_res_model.dart';
import '../repo/orders_repo.dart';

class GetOrdersUseCase {
  final OrdersRepo ordersRepo;
  GetOrdersUseCase({
    required this.ordersRepo,
  });
  Future<ApiResult<OrdersResModel?>> getOrders() async {
    return await ordersRepo.getOrders();
  }
}class CreateOrderUseCase {
  final OrdersRepo ordersRepo;

  CreateOrderUseCase({required this.ordersRepo});

  Future<ApiResult<Order?>> createOrder({
    required FormData formData,
    required Function(double) onProgress, // <-- إضافة دالة لاستقبال التقدم
  }) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_uploadInIsolate, [receivePort.sendPort, formData, onProgress]);

    return await receivePort.first as ApiResult<Order?>;
  }

  static Future<void> _uploadInIsolate(List<dynamic> args) async {
    SendPort sendPort = args[0];
    FormData formData = args[1];
    Function(double) onProgress = args[2];

    try {
      final dio = Dio();
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.onSendProgress = (sent, total) {
            double progress = total > 0 ? sent / total : 0.0;
            onProgress(progress);
          };
          return handler.next(options);
        },
      ));

      final response = await dio.post(
        ApiConstants.orders,
        data: formData,
      );

      final order = Order.fromJson(response.data);
      sendPort.send(ApiResult.success(data: order));
    } catch (error) {
      sendPort.send(ApiResult.failure(apiErrorModel: ApiErrorHandler.handle(error: error)));
    }
  }
}
