import '../../../../core/errors/api_error_model.dart';
import '../../../../core/single_tone/orders_single_tone.dart';
import '../../domain/usecases/orders_use_cases.dart';
import 'orders_event.dart';
import 'orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
 GetOrdersUseCase getOrdersUseCase;
  OrdersBloc({
 required this.getOrdersUseCase,
  }) : super(
          const OrdersState.initial(),
        ) {
    on<OrdersEvent>(
      (event, emit) async {
        await event.when(
          getOrders: () async {
            emit(
              const OrdersState.loading(),
            );
            try {
              final res = await getOrdersUseCase.getOrders();
              await res.when(
                success: (
                  res,
                ) async {
                  OrdersSingletone.instance.ordersResModel = res;
                  emit(
                    const OrdersState.initial(),
                  );
                },
                failure: (
                  apiErrorModel,
                ) async {
                  emit(
                    OrdersState.failure(
                      apiErrorModel: apiErrorModel,
                    ),
                  );
                },
              );
            } catch (e) {
              emit(
                OrdersState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: e.toString(),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

// class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
//   final OrdersController ordersController = OrdersController();
//   final LocalAuthentication auth = LocalAuthentication();

//   OrdersBloc() : super(OrdersInitial()) {
//     on<FetchOrders>(
//       (event, emit) async {
//         emit(OrdersLoading());

//         try {
//           Map<String, dynamic> data = await ordersController.fetchOrders();
//           GetBranchOrdersApiResModel getBranchOrdersApiResModel =
//               GetBranchOrdersApiResModel.fromJson(data);
//           if (data['status']) {
//             emit(
//               OrdersLoadedSuccessfully(
//                 orders: getBranchOrdersApiResModel.orders,
//                 permission: getBranchOrdersApiResModel.permission!,
//               ),
//             );
//           } else {
//             emit(
//               OrderAddedFailure(),
//             );
//           }
//         } catch (e) {
//           emit(
//             OrdersError(
//               message: e.toString(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
