import '../../../../../core/networking/api_result.dart';
import '../../data/models/create_order_req_body.dart';
import '../../data/models/orders_res_model.dart';
import '../repo/orders_repo.dart';

class GetOrdersUseCase {
  final OrdersRepo ordersRepo;
  GetOrdersUseCase({
    required this.ordersRepo,
  });
  Future<ApiResult<OrdersResModel?>> getOrders() async {
    return await ordersRepo.getOrders();
  }
}
class CreateOrderUseCase {
  final OrdersRepo ordersRepo;
  CreateOrderUseCase({
    required this.ordersRepo,
  });
  Future<ApiResult<Order?>> addOrder({
    required CreateOrderReqBody addOrderReqBody,
  }) async {
    return await ordersRepo.createOrder(
      addOrderReqBody: addOrderReqBody,
    );
  }
}

// class ToggleLikeOrderUseCase {
//   final OrdersRepo ordersRepo;
//   ToggleLikeOrderUseCase({
//     required this.ordersRepo,
//   });
//   Future<ApiResult<void>> toggleLike({
//     required OrderToggleLikeReqBody jobToggleLikeReqBody,
//   }) async {
//     return await ordersRepo.toggleLike(
//       jobToggleLikeReqBody: jobToggleLikeReqBody,
//     );
//   }
// }

// class GeOrderCmntsUseCase {
//   final OrdersRepo ordersRepo;
//   GeOrderCmntsUseCase({
//     required this.ordersRepo,
//   });
//   Future<ApiResult<CmntsResModel?>> getCmnts({
//     required int jobId,
//     required int page,
//   }) async {
//     return await ordersRepo.getCmnts(
//       jobId: jobId,
//       page: page,
//     );
//   }
// }

// class OrderCmntUseCase {
//   final OrdersRepo ordersRepo;
//   OrderCmntUseCase({
//     required this.ordersRepo,
//   });
//   Future<ApiResult<Comment?>> cmnt({
//     required OrderCmntReqBody jobCmntReqBody,
//   }) async {
//     return await ordersRepo.cmnt(
//       jobCmntReqBody: jobCmntReqBody,
//     );
//   }
// }
