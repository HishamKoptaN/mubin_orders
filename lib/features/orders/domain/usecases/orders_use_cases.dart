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
}
class CreateOrderUseCase {
  final OrdersRepo ordersRepo;

  CreateOrderUseCase({required this.ordersRepo});

  Future<ApiResult<Order?>> createOrder({
    required FormData formData,
    required Function(double) onProgress,
  }) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_uploadInIsolate, [receivePort.sendPort, formData]);

    return await receivePort.first as ApiResult<Order?>;
  }

  static Future<void> _uploadInIsolate(List<dynamic> args) async {
    SendPort sendPort = args[0];
    FormData formData = args[1];

    try {
      final dio = Dio();

      final response = await dio.post(
        ApiConstants.orders,
        data: formData,
        onSendProgress: (sent, total) {
          double progress = total > 0 ? sent / total : 0.0;
          sendPort.send(progress);
        },
      );

      final order = Order.fromJson(response.data);
      sendPort.send(ApiResult.success(data: order));
    } catch (error) {
      sendPort.send(ApiResult.failure(apiErrorModel: ApiErrorHandler.handle(error: error)));
    }
  }
}


// class ToggleLikeOrderUseCase {
//   final OrdersRepo ordersRepo;
//   ToggleLikeOrderUseCase({
//     required this.ordersRepo,
//   });
//   Future<ApiResult<void>> toggleLike({
//     required OrderToggleLikeReqBody jobToggleLikeReqBody,
//   }) async {
//     return await ordersRepo.toggleLike(
//       jobToggleLikeReqBody: jobToggleLikeReqBody,
//     );
//   }
// }

// class GeOrderCmntsUseCase {
//   final OrdersRepo ordersRepo;
//   GeOrderCmntsUseCase({
//     required this.ordersRepo,
//   });
//   Future<ApiResult<CmntsResModel?>> getCmnts({
//     required int jobId,
//     required int page,
//   }) async {
//     return await ordersRepo.getCmnts(
//       jobId: jobId,
//       page: page,
//     );
//   }
// }

// class OrderCmntUseCase {
//   final OrdersRepo ordersRepo;
//   OrderCmntUseCase({
//     required this.ordersRepo,
//   });
//   Future<ApiResult<Comment?>> cmnt({
//     required OrderCmntReqBody jobCmntReqBody,
//   }) async {
//     return await ordersRepo.cmnt(
//       jobCmntReqBody: jobCmntReqBody,
//     );
//   }
// }
