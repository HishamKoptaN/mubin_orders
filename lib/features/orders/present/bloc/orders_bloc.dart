import 'dart:async';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/single_tone/orders_single_tone.dart';
import 'package:location/location.dart' as loc;
import '../../../../core/utils/app_colors.dart';
import '../../domain/usecases/orders_use_cases.dart';
import 'package:flutter/cupertino.dart';
import 'orders_event.dart';
import 'orders_state.dart';
import 'package:flutter/foundation.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  GetOrdersUseCase getOrdersUseCase;
  CreateOrderUseCase createOrderUseCase;

  final ImagePicker imagePicker = ImagePicker();
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
          pickFile: (
            context,
            fileType,
            imageSelection,
          ) async {
            emit(const OrdersState.loading());
            try {
              XFile? file = await selectFilesPath(
                context: context,
                fileType: fileType,
                imageSelection: imageSelection,
              );
              emit(
                OrdersState.imagePicked(
                    file: file!,
                    fileType: fileType,
                    imageSelection: imageSelection),
              );
            } catch (e) {
              emit(
                OrdersState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: "خطأ في التقاط الفيديو: ${e.toString()}",
                  ),
                ),
              );
            }
          },
          createOrder: (clientId,
          ) async {
            try {
              final result = await createOrderUseCase.createOrder(
                file: file,
                onSendProgress: (sent, total) {
                  String? uploadProgress;
                  uploadProgress = "${(sent / total) * 100}%";
                  log("sent: $sent,total: $total");
                  emit(
                    OrdersState.uploading(
                      progress: uploadProgress,
                    ),
                  );
                },
              );
              await result.when(
                success: (order) async {
                  emit(const OrdersState.success(),
                  );
                },
                failure: (apiErrorModel) async {
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

  Future<XFile?> selectFilesPath({
    required BuildContext context,
    required FileType fileType,
    required ImageSelection? imageSelection,
  }) async {
    final t = AppLocalizations.of(context)!;
    return await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        XFile? file;

        return AlertDialog(
          content: Text(t.select_files),
          actions: [
            IconsOutlineButton(
              onPressed: () async {
                file = await pickImageCamera();
                Navigator.of(context).pop(file);
              },
              text: t.camera,
              iconData: CupertinoIcons.camera_fill,
              textStyle: const TextStyle(color: Colors.white),
              color: AppColors.greenColor,
              iconColor: Colors.white,
            ),
            IconsOutlineButton(
              onPressed: () async {
                if (fileType == FileType.image) {
                  file = await pickImageGallery();
                } else if (fileType == FileType.video) {
                  file = await pickVideoGallery();
                }
                Navigator.of(context).pop(file);
              },
              text: t.gallery,
              iconData: CupertinoIcons.photo_on_rectangle,
              color: AppColors.greenColor,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ],
        );
      },
    );
  }

  Future<void> pickVideo() async {
    XFile? videoFile = await imagePicker.pickVideo(
      source: ImageSource.camera,
    );
    if (videoFile != null) {
      videoFile = videoFile;
    }
  }

  Future<XFile?> pickVideoGallery() async {
    XFile? videoFile = await imagePicker.pickVideo(
      source: ImageSource.gallery,
    );
    if (videoFile != null) {
      return videoFile;
    }
    return null;
  }

  Future<XFile?> pickImageCamera() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile != null) {
      return imageFile;
    }
    return null;
  }

  Future<XFile?> pickImageGallery() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      return imageFile;
    }
    return null;
  }
}
// Map<String, double>? location = await getCurrentLocation();
              // var latitude = location!['latitude'] ?? 0.0;
              // var longitude = location['longitude'] ?? 0.0;
              // final res = await createOrderUseCase.createOrder(
              //   formData: formData,
              //   onProgress: (progress) {
              //     emit(
              //       OrdersState.progress(
              //         progress: progress,
              //       ),
              //     );
              //   },
              // );
              // await res.when(
              //   success: (
              //     res,
              //   ) async {
              //     // OrdersSingletone.instance.ordersResModel = res;
              //     emit(
              //       const OrdersState.initial(),
              //     );
              //   },
              //   failure: (
              //     apiErrorModel,
              //   ) async {
              //     emit(
              //       OrdersState.failure(
              //         apiErrorModel: apiErrorModel,
              //       ),
              //     );
              //   },
              // );
  //             static Future<void> _uploadInIsolate(List<dynamic> args) async {
  // SendPort sendPort = args[0];
  // FormData formData = args[1];

  // try {
  //   final dio = Dio();
  //   print("📡 Sending request...");
    
  //   final response = await dio.post(
  //     ApiConstants.orders,
  //     data: formData,
  //     onSendProgress: (sent, total) {
  //       double progress = total > 0 ? sent / total : 0.0;
  //       print('📤 Upload Progress: ${(progress * 100).toStringAsFixed(2)}%');
  //       sendPort.send(progress);
  //     },
  //   );

  //   final order = Order.fromJson(response.data);
  //   sendPort.send(ApiResult.success(data: order));
  // } catch (error, stacktrace) {
  //   print("❌ Upload Failed: $error \n$stacktrace");
  //   sendPort.send(ApiResult.failure(apiErrorModel: ApiErrorHandler.handle(error: error)));
  // }
// }
