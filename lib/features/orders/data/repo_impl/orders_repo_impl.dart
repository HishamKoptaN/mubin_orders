import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../domain/repo/orders_repo.dart';
import '../datasources/orders_api.dart';
import '../models/orders_res_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersApi postsApi;
  OrdersRepoImpl({
    required this.postsApi,
  });
  @override
  Future<ApiResult<OrdersResModel?>> getOrders() async {
    try {
      final res = await postsApi.getOrders();
      return ApiResult.success(
        data: res,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  // @override
  // Future<ApiResult<Job?>> addJob({
  //   required AddJobReqBody addJobReqBody,
  // }) async {
  //   try {
  //     final res = await postsApi.addJob(
  //       addJobReqBody: addJobReqBody,
  //     );
  //     return ApiResult.success(
  //       data: res,
  //     );
  //   } catch (error) {
  //     return ApiResult.failure(
  //       apiErrorModel: ApiErrorHandler.handle(
  //         error: error,
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<ApiResult<void>> toggleLike({
  //   required JobToggleLikeReqBody postToggleLikeReqBody,
  // }) async {
  //   try {
  //     await postsApi.toggleLike(
  //       id: postToggleLikeReqBody.id ?? 0,
  //     );
  //     return ApiResult.success(
  //       data: null,
  //     );
  //   } catch (error) {
  //     return ApiResult.failure(
  //       apiErrorModel: ApiErrorHandler.handle(
  //         error: error,
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<ApiResult<CmntsResModel?>> getCmnts({
  //   required int postId,
  //   required int page,
  // }) async {
  //   try {
  //     final res = await postsApi.getCmnts(
  //       postId: postId,
  //       page: page,
  //     );
  //     return ApiResult.success(
  //       data: res,
  //     );
  //   } catch (error) {
  //     return ApiResult.failure(
  //       apiErrorModel: ApiErrorHandler.handle(
  //         error: error,
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future<ApiResult<Comment?>> cmnt({
  //   required JobCmntReqBody postCmntReqBody,
  // }) async {
  //   try {
  //     final res = await postsApi.cmnt(
  //       postCmntReqBody: postCmntReqBody,
  //     );
  //     return ApiResult.success(
  //       data: res,
  //     );
  //   } catch (error) {
  //     return ApiResult.failure(
  //       apiErrorModel: ApiErrorHandler.handle(
  //         error: error,
  //       ),
  //     );
  //   }
  // }
}
