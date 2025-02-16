import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/single_tone/orders_single_tone.dart';
import 'package:location/location.dart' as loc;
import '../../../../core/utils/app_colors.dart';
import '../../domain/usecases/orders_use_cases.dart';
import 'package:flutter/cupertino.dart';
import 'orders_event.dart';
import 'orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          pickFile: ( context, fileType,imageSelection,) async {
            emit(const OrdersState.loading());
               selectFilesPath(
                context: context, fileType: fileType,imageSelection:imageSelection,
               );
            try {
              // final XFile? pickedFile = await imagePicker.pickVideo(
              //   source: source,
              // );
              // if (pickedFile != null) {
              //   emit(
              //     OrdersState.videoPicked(
              //       videoFile: File(
              //         pickedFile.path,
              //       ),
              //     ),
              //   );
              // } else {
              //   emit(OrdersState.failure(
              //     apiErrorModel: ApiErrorModel(
              //       error: "لم يتم اختيار فيديو",
              //     ),
              //   ),
              //   );
              // }
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
          createOrder: (formData) async {
            emit(
              const OrdersState.loading(),
            );
            try {
               Map<String, double>? location = await getCurrentLocation();
                var latitude = location!['latitude'] ?? 0.0;
                var longitude = location['longitude'] ?? 0.0;
//              'latitude': latitude.toString(),
//              'longitude': longitude.toString(),
              final res = await createOrderUseCase.createOrder(
                formData: formData,
                onProgress: (progress) {
                  emit(
                    OrdersState.progress(
                      progress: progress,
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

  void selectFilesPath({
    required BuildContext context,
    required FileType fileType,
    required ImageSelection? imageSelection
,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
          final t = AppLocalizations.of(context)!;
  return AlertDialog(
          content: Text(
            t.select_files,
          ),
          actions: [
            IconsOutlineButton(
              onPressed: () async {
                 XFile?  file = await pickImageCamera();
                 Navigator.of(context).pop();
              },
              text: t.camera,
              iconData: CupertinoIcons.camera_fill,
              textStyle: const TextStyle(color: Colors.white,
              ),
              color: AppColors.greenColor,
              iconColor: Colors.white,
            ),
            IconsOutlineButton(
              onPressed: () async {
                // switch (file) {
                //   case 0:
                //     await pickVideoGallery();
                //     break;
                //   case 1:
                //   case 2:
                //     await pickImageGallery(
                //       imageNumber: file,
                //     );
                //     break;
                // }
                Navigator.of(context).pop();
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
  Future< XFile?> pickVideoGallery() async {
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
   Future<XFile?> pickImageGallery({
    required int imageNumber,
  }) async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
   if (imageFile != null) {
   return imageFile;
    }
    return null;
  }
}
