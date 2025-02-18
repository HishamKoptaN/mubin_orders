import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
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
    required String clientId,
    required String placeName,
    required File video,
    required File imageOne,
    required File imageTwo,
    required String latitude,
    required String longitude,
    required ProgressCallback? onSendProgress,
  }) async {
    try {
      final res = await postsApi.createOrder(
        clientId: clientId,
        placeName: placeName,
        video: video,
        imageOne: imageOne,
        imageTwo: imageTwo,
        latitude: latitude,
        longitude: longitude,
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
