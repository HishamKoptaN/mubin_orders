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