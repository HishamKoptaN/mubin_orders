import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/single_tone/orders_single_tone.dart';
import 'package:location/location.dart' as loc;
import '../../domain/usecases/orders_use_cases.dart';
import 'orders_event.dart';
import 'orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
 GetOrdersUseCase getOrdersUseCase;
 CreateOrderUseCase createOrderUseCase;
   final ImagePicker _imagePicker = ImagePicker();
  OrdersBloc({
 required this.getOrdersUseCase,
 required this.createOrderUseCase,



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
          pickImage: ( source,  type) async{ 
 emit(const OrdersState.loading());

      try {
        final XFile? pickedFile = await _imagePicker.pickImage(source: source,);
        if (pickedFile != null) {
          emit(OrdersState.imagePicked(imageFile: File(pickedFile.path), type: type,
          ),);
        } else {
          emit( OrdersState.failure(apiErrorModel: ApiErrorModel(
          error:  "لم يتم اختيار صورة",
        ),),
        );
        }
      } catch (e) {
        emit(OrdersState.failure(apiErrorModel:
        ApiErrorModel(
          error: "خطأ في التقاط الصورة: ${e.toString()}",
        ),
         ),
        );
      }


           },
          
          pickVideo: (ImageSource source) async{ emit(const OrdersState.loading());

      try {
        final XFile? pickedFile = await _imagePicker.pickVideo(source: source,);
        if (pickedFile != null) {
          emit(OrdersState.videoPicked(videoFile: File(pickedFile.path,),),);
        } else {
          emit( OrdersState.failure(apiErrorModel:ApiErrorModel(
                    error:  "لم يتم اختيار فيديو",
                  ),));
        }
      } catch (e) {
        emit(OrdersState.failure(apiErrorModel:ApiErrorModel(
                    error:  "خطأ في التقاط الفيديو: ${e.toString()}",
                  ),));
      }
    }, createOrder: ( createOrderReqBody)async {
      
         emit(
              const OrdersState.loading(),
            );
            
            try {
              final res = await createOrderUseCase.createOrder(
                createOrderReqBody: createOrderReqBody,
              onProgress: (progress) {

        emit(OrdersState.progress(progress: progress,
        ),
        );
      },
      );
              await res.when(
                success: (
                  res,
                ) async {
                  // OrdersSingletone.instance.ordersResModel = res;
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
Future<Map<String, double>?> getCurrentLocation() async {
    final loc.Location location = loc.Location();
    try {
      var locationData = await location.getLocation();
      return {
        'latitude': locationData.latitude ?? 0.0,
        'longitude': locationData.longitude ?? 0.0,
      };
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  } 