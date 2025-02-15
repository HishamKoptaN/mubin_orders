import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/add_order_req_body.dart';
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
  // ! Get
  @GET(
    ApiConstants.orders,
  )
  Future<OrdersResModel?> getOrders();
  // ! Create post
  @POST(
    ApiConstants.orders,
  )
  Future<Order?> addOrder({
    @Body() required CreateOrderReqBody createOrderReqBody,
  });
  // // ! toggle like
  // @PUT(
  //   "${ApiConstants.posts}/{id}",
  // )
  // Future<void> toggleLike({
  //   @Path('id') required int id,
  // });
  // // ! Get cmnts
  // @GET("${ApiConstants.postCmnts}/{postId}")
  // Future<CmntsResModel?> getCmnts({
  //   @Path("postId") required int postId,
  //   @Query("page") required int page,
  // });
  // // ! cmnt
  // @POST(
  //   ApiConstants.postCmnts,
  // )
  // Future<Comment?> cmnt({
  //   @Body() required OrderCmntReqBody postCmntReqBody,
  // });
}
