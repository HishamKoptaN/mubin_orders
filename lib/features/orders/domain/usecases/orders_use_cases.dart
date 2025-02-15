import '../../../../../core/networking/api_result.dart';
import '../../data/models/orders_res_model.dart';
import '../repo/orders_repo.dart';

class GetOrdersUseCase {
  final OrdersRepo jobsRepo;
  GetOrdersUseCase({
    required this.jobsRepo,
  });
  Future<ApiResult<OrdersResModel?>> getOrders() async {
    return await jobsRepo.getOrders();
  }
}
// class CreateJobUseCase {
//   final OrdersRepo jobsRepo;
//   CreateJobUseCase({
//     required this.jobsRepo,
//   });
//   Future<ApiResult<Job?>> addJob({
//     required AddJobReqBody addJobReqBody,
//   }) async {
//     return await jobsRepo.addJob(
//       addJobReqBody: addJobReqBody,
//     );
//   }
// }

// class ToggleLikeJobUseCase {
//   final OrdersRepo jobsRepo;
//   ToggleLikeJobUseCase({
//     required this.jobsRepo,
//   });
//   Future<ApiResult<void>> toggleLike({
//     required JobToggleLikeReqBody jobToggleLikeReqBody,
//   }) async {
//     return await jobsRepo.toggleLike(
//       jobToggleLikeReqBody: jobToggleLikeReqBody,
//     );
//   }
// }

// class GeJobCmntsUseCase {
//   final OrdersRepo jobsRepo;
//   GeJobCmntsUseCase({
//     required this.jobsRepo,
//   });
//   Future<ApiResult<CmntsResModel?>> getCmnts({
//     required int jobId,
//     required int page,
//   }) async {
//     return await jobsRepo.getCmnts(
//       jobId: jobId,
//       page: page,
//     );
//   }
// }

// class JobCmntUseCase {
//   final OrdersRepo jobsRepo;
//   JobCmntUseCase({
//     required this.jobsRepo,
//   });
//   Future<ApiResult<Comment?>> cmnt({
//     required JobCmntReqBody jobCmntReqBody,
//   }) async {
//     return await jobsRepo.cmnt(
//       jobCmntReqBody: jobCmntReqBody,
//     );
//   }
// }
