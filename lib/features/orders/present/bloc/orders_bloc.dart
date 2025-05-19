import 'dart:developer';

import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/add_order_req_model.dart';
import '../../data/models/orders_res_model.dart';
import '../../domain/usecases/orders_use_cases.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersUseCase ordersUseCase;
  List<Order>? allOrders;
  AddOrderReqModel addOrderReqModel = AddOrderReqModel();
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
                  emit(
                    OrdersState.loaded(
                      orders: allOrders ?? [],
                      hasMore: false,
                      addOrderReqModel: addOrderReqModel,
                      uploadingProgress: null,
                    ),
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
            }
          },
          updateData: (
            addOrderReqModel,
          ) async {
            try {
              this.addOrderReqModel = addOrderReqModel;
              emit(
                OrdersState.loaded(
                  orders: allOrders ?? [],
                  hasMore: false,
                  addOrderReqModel: this.addOrderReqModel,
                  uploadingProgress: null,
                ),
              );
            } catch (e) {
              emit(
                OrdersState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: e.toString(),
                  ),
                ),
              );
              emit(
                OrdersState.loaded(
                  orders: allOrders ?? [],
                  hasMore: false,
                  addOrderReqModel: this.addOrderReqModel,
                  uploadingProgress: null,
                ),
              );
            }
          },
          createOrder: () async {
            if (addOrderReqModel.isComplete) {
              try {
                emit(
                  OrdersState.loaded(
                    orders: allOrders ?? [],
                    hasMore: false,
                    addOrderReqModel: addOrderReqModel,
                    uploadingProgress: "1",
                  ),
                );
                final result = await ordersUseCase.createOrder(
                  addOrderReqModel: addOrderReqModel,
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
                        addOrderReqModel: addOrderReqModel,
                        uploadingProgress: uploadProgress,
                      ),
                    );
                  },
                );
                await result.when(
                  success: (
                    order,
                  ) async {
                    addOrderReqModel = AddOrderReqModel.empty();
                    allOrders = [
                      order!,
                      ...?allOrders,
                    ];
                    emit(
                      const OrdersState.success(),
                    );
                    emitCustomLoaded(
                      emit,
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
                    emitCustomLoaded(emit);
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
                emitCustomLoaded(emit);
              }
            } else {
              emit(
                OrdersState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: "قم بملئ جميع الحقول",
                  ),
                ),
              );
              emitCustomLoaded(emit);
            }
          },
        );
      },
    );
  }

  void emitCustomLoaded(Emitter<OrdersState> emit) {
    return emit(
      OrdersState.loaded(
        orders: allOrders ?? [],
        hasMore: false,
        addOrderReqModel: addOrderReqModel,
        uploadingProgress: null,
      ),
    );
  }
}
