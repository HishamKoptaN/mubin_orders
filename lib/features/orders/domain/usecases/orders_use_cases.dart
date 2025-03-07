import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
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

  CreateOrderUseCase({
    required this.ordersRepo,
  });

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
    return await ordersRepo.createOrder(
      clientId: clientId,
      placeName: placeName,
      video: video,
      imageOne: imageOne,
      imageTwo: imageTwo,
      onSendProgress: onSendProgress,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
