import 'orders_event.dart';
import 'orders_state.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final FirebaseAuth auth;

  OrdersBloc({
    required this.auth,
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
            User? user = FirebaseAuth.instance.currentUser;
            String? idToken = await user?.getIdToken();
            if (idToken == null
                // && idToken!.isEmpty
                ) {
              log("id token $idToken");
              emit(
                const OrdersState.success(),
              );
            } else {
              log("id token $idToken");
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
