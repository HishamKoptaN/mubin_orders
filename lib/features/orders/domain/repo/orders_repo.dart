import '../../../../../core/networking/api_result.dart';
import '../../data/models/orders_res_model.dart';

abstract class OrdersRepo {
  Future<ApiResult<OrdersResModel?>> getOrders();
  // Future<ApiResult<Job?>> addJob({
  //   required AddJobReqBody addJobReqBody,
  // });

  // Future<ApiResult<void>> toggleLike({
  //   required JobToggleLikeReqBody postToggleLikeReqBody,
  // });
  // Future<ApiResult<CmntsResModel?>> getCmnts({
  //   required int postId,
  //   required int page,
  // });

  // Future<ApiResult<Comment?>> cmnt({
  //   required JobCmntReqBody postCmntReqBody,
  // });
}
