import 'dart:developer';
import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/orders_res_model.dart';
import '../../domain/entities/add_order_req.dart';
import '../../domain/usecases/orders_use_cases.dart';
import 'orders_event.dart';
import 'orders_state.dart';
import 'package:injectable/injectable.dart' show Injectable;

@Injectable()
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersUseCase ordersUseCase;
  List<Order>? allOrders;
  Meta? meta;
  AddOrderReq addOrderReq = AddOrderReq();
  OrdersBloc({
    required this.ordersUseCase,
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
              final res = await ordersUseCase.getOrders();
              await res.when(
                success: (
                  res,
                ) async {
                  allOrders = res?.orders ?? [];
                  meta = res?.meta ?? Meta();

                  emitCustomLoaded(
                    emit: emit,
                  );
                },
                failure: (
                  apiErrorModel,
                ) async {
                  emit(
                    OrdersState.getOrdersfailure(
                      apiErrorModel: apiErrorModel,
                    ),
                  );
                  emitCustomLoaded(
                    emit: emit,
                  );
                },
              );
            } catch (e) {
              emit(
                OrdersState.getOrdersfailure(
                  apiErrorModel: ApiErrorModel(
                    error: e.toString(),
                  ),
                ),
              );
              emitCustomLoaded(
                emit: emit,
              );
            }
          },
          updateData: (
            addOrderReq,
          ) async {
            try {
              this.addOrderReq = addOrderReq;
              emitCustomLoaded(
                emit: emit,
              );
            } catch (e) {
              emit(
                OrdersState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: e.toString(),
                  ),
                ),
              );
              emitCustomLoaded(
                emit: emit,
              );
            }
          },
          createOrder: () async {
            if (addOrderReq.isComplete) {
              try {
                emit(
                  OrdersState.loaded(
                    orders: allOrders ?? [],
                    hasMore: false,
                    addOrderReq: addOrderReq,
                    uploadingProgress: "1",
                  ),
                );
                final result = await ordersUseCase.createOrder(
                  addOrderReq: addOrderReq,
                  onSendProgress: (
                    sent,
                    total,
                  ) {
                    String? uploadProgress =
                        "${((sent / total) * 100).toInt()}%";
                    log(uploadProgress);
                    emit(
                      OrdersState.loaded(
                        orders: allOrders ?? [],
                        hasMore: false,
                        addOrderReq: addOrderReq,
                        uploadingProgress: uploadProgress,
                      ),
                    );
                  },
                );
                await result.when(
                  success: (
                    order,
                  ) async {
                    addOrderReq = AddOrderReq.empty();
                    allOrders = [
                      order!,
                      ...?allOrders,
                    ];
                    emit(
                      const OrdersState.success(),
                    );
                    emitCustomLoaded(
                      emit: emit,
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
                    emitCustomLoaded(
                      emit: emit,
                    );
                  },
                );
              } catch (e, s) {
                debugPrint(
                  "❌ Exception in createOrder: $e\n$s",
                );
                emit(
                  OrdersState.failure(
                    apiErrorModel: ApiErrorModel(
                      error: e.toString(),
                    ),
                  ),
                );
                emitCustomLoaded(
                  emit: emit,
                );
              }
            } else {
              emit(
                OrdersState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: "قم بملئ جميع الحقول",
                  ),
                ),
              );
              emitCustomLoaded(
                emit: emit,
              );
            }
          },
        );
      },
    );
  }

  void emitCustomLoaded({
    required Emitter<OrdersState> emit,
  }) {
    emit(
      OrdersState.loaded(
        orders: allOrders ?? [],
        hasMore: meta?.hasNextPage ?? false,
        addOrderReq: addOrderReq,
        uploadingProgress: null,
      ),
    );
  }
}
