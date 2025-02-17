import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart' show XFile;
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
    required File file,
    required ProgressCallback?  onSendProgress,
  }) async {
    return await ordersRepo.createOrder(
      file: file,
     onSendProgress:  onSendProgress,
    );
  }
}
