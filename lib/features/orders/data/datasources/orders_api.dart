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
@POST(ApiConstants.orders,
)
Future<Order?> createOrder( {
  @Body() required FormData formData,
});


}
