import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/orders_res_model.dart';
part 'orders_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class OrdersApi {
  factory OrdersApi(
    Dio dio, {
    String? baseUrl,
  }) = _OrdersApi;

  @GET(
    ApiConstants.orders,
  )
  Future<OrdersResModel?> getOrders();
  @POST(
    ApiConstants.orders,
  )
  @MultiPart()
  Future<Order> createOrder({
    @Part(name: 'image_one') required File file,
    @SendProgress()required ProgressCallback?  onSendProgress,
  });
}
