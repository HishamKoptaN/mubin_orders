import 'package:dio/dio.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/repo/orders_repo.dart';
import '../datasources/orders_api.dart';
import '../models/create_order_req_body.dart';
import '../models/orders_res_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersApi postsApi;
  OrdersRepoImpl({
    required this.postsApi,
  });
  @override
  Future<ApiResult<OrdersResModel?>> getOrders() async {
    try {
      final res = await postsApi.getOrders();
      return ApiResult.success(
        data: res,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

 Future<ApiResult<Order?>> createOrder({
  required CreateOrderReqBody createOrderReqBody,
  required Function(double) onProgress, // <-- إضافة دالة لاستقبال التقدم
}) async {
  try {
    final videoFile = await MultipartFile.fromFile(
      createOrderReqBody.video!,
      filename: "video.mp4",
    );

    final imageOneFile = await MultipartFile.fromFile(
      createOrderReqBody.imageOne!,
      filename: "image1.jpg",
    );

    final imageTwoFile = await MultipartFile.fromFile(
      createOrderReqBody.imageTwo!,
      filename: "image2.jpg",
    );

    final formData = FormData.fromMap({
      "client_id": createOrderReqBody.clientId,
      "place": createOrderReqBody.place,
      "latitude": createOrderReqBody.latitude,
      "longitude": createOrderReqBody.longitude,
      "video": videoFile,
      "image1": imageOneFile,
      "image2": imageTwoFile,
    });

    final dio = Dio(); // إنشاء Dio
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.onSendProgress = (count, total) {
            double progress = (count / total);
            onProgress(progress); 
          };
          return handler.next(options);
        },
      ),
    );

    final res = await dio.post(
      ApiConstants.orders,
      data: formData,
    );

    return ApiResult.success(data: Order.fromJson(res.data));
  } catch (error) {
    return ApiResult.failure(apiErrorModel: ApiErrorHandler.handle(error: error));
  }
}

}
