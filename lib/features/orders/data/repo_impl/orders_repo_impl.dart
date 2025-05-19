import 'package:dio/dio.dart';
import 'package:mubin_orders/features/orders/data/models/add_order_req_model.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
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
    required AddOrderReqModel addOrderReqModel,
    required ProgressCallback? onSendProgress,
  }) async {
    try {
      final res = await postsApi.createOrder(
        clientId: addOrderReqModel.clientId ?? '0',
        placeName: addOrderReqModel.placeName ?? '',
        video: addOrderReqModel.video!,
        imageOne: addOrderReqModel.imageOne!,
        imageTwo: addOrderReqModel.imageTwo!,
        latitude: addOrderReqModel.latitude ?? '0.0',
        longitude: addOrderReqModel.longitude ?? '0.0',
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
