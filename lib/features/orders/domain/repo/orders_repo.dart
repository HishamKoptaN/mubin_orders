import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/networking/api_result.dart';
import '../../data/models/orders_res_model.dart';

abstract class OrdersRepo {
  Future<ApiResult<OrdersResModel?>> getOrders();
  Future<ApiResult<Order?>> createOrder({
     required File file,
   required ProgressCallback?  onSendProgress,
  });

}
