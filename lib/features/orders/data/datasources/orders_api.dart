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
  // ! Get
  @GET(
    ApiConstants.orders,
  )
  Future<OrdersResModel?> getOrders();
  // // ! Add post
  // @POST(
  //   ApiConstants.posts,
  // )
  // Future<Job?> addJob({
  //   @Body() required AddJobReqBody addJobReqBody,
  // });
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
  //   @Body() required JobCmntReqBody postCmntReqBody,
  // });
}
