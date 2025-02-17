import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/repo/orders_repo.dart';
import '../datasources/orders_api.dart';
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

  @override
  Future<ApiResult<Order?>> createOrder({
    required FormData formData,
    required Function(double) onProgress, // <-- إضافة دالة لاستقبال التقدم
  }) async {
    try {
      final dio = Dio(); // إنشاء Dio
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.onSendProgress = (sent, total) {
              double progress = (sent / total);
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