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
  Future<Order> createOrder({
    @Part(name: 'client_id') required String clientId,
    @Part(name: 'place') required String placeName,
    @Part(name: 'video') required File video,
    @Part(name: 'image_one') required File imageOne,
    @Part(name: 'image_two') required File imageTwo,
    @Part(name: 'latitude') required double latitude,
    @Part(name: 'longitude') required double longitude,
    @SendProgress() required ProgressCallback? onSendProgress,
  });
}
