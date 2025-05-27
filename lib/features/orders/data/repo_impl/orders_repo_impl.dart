import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../domain/entities/add_order_req.dart';
import '../../domain/repo/orders_repo.dart';
import 'dart:async';
import '../datasources/orders_api.dart';
import '../models/orders_res_model.dart';
import 'package:injectable/injectable.dart' show Injectable;

@Injectable(
  as: OrdersRepo,
)
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
    required AddOrderReq addOrderReq,
    required ProgressCallback? onSendProgress,
  }) async {
    try {
      final res = await postsApi.createOrder(
        clientId: addOrderReq.clientNumber ?? '0',
        placeName: addOrderReq.placeName ?? '',
        video: addOrderReq.video!,
        imageOne: addOrderReq.imageOne!,
        imageTwo: addOrderReq.imageTwo!,
        latitude: addOrderReq.latitude ?? '0.0',
        longitude: addOrderReq.longitude ?? '0.0',
        onSendProgress: onSendProgress,
      );
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
}
