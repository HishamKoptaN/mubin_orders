import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/add_order_req_model.dart';
import 'package:location/location.dart' as loc;
import '../../data/models/location_model.dart';
import '../../data/models/orders_res_model.dart';
import '../../domain/usecases/orders_use_cases.dart';
import 'package:location/location.dart';
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
                  uploadingProgress: '',
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
                  uploadingProgress: '',
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
                debugPrint("📦 Files:");
                debugPrint("📸 imageOne: ${addOrderReqModel.imageOne?.path}");
                debugPrint("📸 imageTwo: ${addOrderReqModel.imageTwo?.path}");
                debugPrint("🎥 video: ${addOrderReqModel.video?.path}");
                debugPrint("🧍 clientId: ${addOrderReqModel.clientId}");
                LocationModel? locationData = await getCurrentLocation();
                addOrderReqModel = addOrderReqModel.copyWith(
                  longitude: locationData?.longitude?.toString(),
                  latitude: locationData?.latitude?.toString(),
                );
                final result = await ordersUseCase.createOrder(
                  addOrderReqModel: addOrderReqModel,
                  onSendProgress: (
                    sent,
                    total,
                  ) {
                    String? uploadProgress =
                        "${((sent / total) * 100).toInt()}%" ?? '0';
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
                    allOrders = [
                      order!,
                      ...?allOrders,
                    ];
                    emit(
                      const OrdersState.success(),
                    );
                    emitCustomLoaded(emit);
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

  Future<LocationModel?> getCurrentLocation() async {
    try {
      final loc.Location location = loc.Location();
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return LocationModel(latitude: 0.0, longitude: 0.0);
        }
      }
      loc.PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return LocationModel(latitude: 0.0, longitude: 0.0);
        }
      }
      var locationData = await location.getLocation();
      return LocationModel.fromLocationData(locationData);
    } catch (e) {
      return LocationModel(
        latitude: 0.0,
        longitude: 0.0,
      );
    }
  }
}
