import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/add_order_req_model.dart';
import '../../data/models/orders_res_model.dart';
import '../entities/add_order_req.dart';
import '../repo/orders_repo.dart';
import 'package:injectable/injectable.dart' show LazySingleton;

@LazySingleton()
class OrdersUseCase {
  final OrdersRepo ordersRepo;
  OrdersUseCase({
    required this.ordersRepo,
  });
  Future<ApiResult<OrdersResModel?>> getOrders() async {
    return await ordersRepo.getOrders();
  }

  Future<ApiResult<Order?>> createOrder({
    required AddOrderReq addOrderReq,
    required ProgressCallback? onSendProgress,
  }) async {
    return await ordersRepo.createOrder(
      addOrderReq: addOrderReq,
      onSendProgress: onSendProgress,
    );
  }
}
