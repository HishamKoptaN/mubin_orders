import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/orders_res_model.dart';

abstract class OrdersRepo {
  Future<ApiResult<OrdersResModel?>> getOrders();
  Future<ApiResult<Order?>> createOrder({
    required String clientId,
      required String placeName,
      required File video,
      required File imageOne,
      required File imageTwo,  required double latitude,
      required double longitude,
   required ProgressCallback?  onSendProgress,
  });

}
