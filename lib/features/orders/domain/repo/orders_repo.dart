import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/add_order_req_model.dart';
import '../../data/models/orders_res_model.dart';

abstract class OrdersRepo {
  Future<ApiResult<OrdersResModel?>> getOrders();
  Future<ApiResult<Order?>> createOrder({
    required AddOrderReqModel addOrderReqModel,
    required ProgressCallback? onSendProgress,
  });
}
