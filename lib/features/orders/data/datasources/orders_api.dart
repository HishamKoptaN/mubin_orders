import 'dart:io';

import 'package:dio/dio.dart';
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
  Future<HttpResponse> createOrder({
    @Part(name: 'file')required File file,
  });
}
