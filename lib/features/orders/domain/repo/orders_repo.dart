import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/orders_res_model.dart';

abstract class OrdersRepo {
  Future<ApiResult<OrdersResModel?>> getOrders();
  Future<ApiResult<Order?>> createOrder({
     required FormData formData,
    required Function(double) onProgress,
  });

  // Future<ApiResult<void>> toggleLike({
  //   required OrderToggleLikeReqBody postToggleLikeReqBody,
  // });
  // Future<ApiResult<CmntsResModel?>> getCmnts({
  //   required int postId,
  //   required int page,
  // });

  // Future<ApiResult<Comment?>> cmnt({
  //   required OrderCmntReqBody postCmntReqBody,
  // });
}
