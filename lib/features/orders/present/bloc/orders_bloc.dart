import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/single_tone/orders_single_tone.dart';
import 'package:location/location.dart' as loc;
import '../../../../core/utils/app_colors.dart';
import '../../data/models/location_model.dart';
import '../../domain/usecases/orders_use_cases.dart';
import 'package:flutter/cupertino.dart';
import 'orders_event.dart';
import 'orders_state.dart';
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
          createOrder: (
            clientId,
            placeName,
            video,
            imageOne,
            imageTwo,
          ) async {
            LocationModel? locationData = await getCurrentLocation();
            try {
              final result = await createOrderUseCase.createOrder(
                clientId: clientId,
                placeName: placeName,
                video: video,
                imageOne: imageOne,
                imageTwo: imageTwo,
                latitude: locationData?.latitude ?? 0.0,
                longitude: locationData?.longitude ?? 0.0,
                onSendProgress: (sent, total) {
                  String? uploadProgress;
                  uploadProgress = "${((sent / total) * 100).toInt()}%";
                  emit(
                    OrdersState.uploading(
                      progress: uploadProgress,
                    ),
                  );
                },
              );
              await result.when(
                success: (order) async {
                  emit(
                    const OrdersState.success(),
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

  Future<LocationModel?> getCurrentLocation() async {
    try {
      final loc.Location location = loc.Location();
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) return null;
      }
      loc.PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) return null;
      }
      var locationData = await location.getLocation();
      return LocationModel.fromLocationData(locationData);
    } catch (e) {
      return null;
    }
  }
}
