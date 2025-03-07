import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import '../../../../core/all_imports.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/single_tone/orders_single_tone.dart';
import 'package:location/location.dart' as loc;
import '../../../../core/utils/app_colors.dart';
import '../../data/models/location_model.dart';
import '../../data/models/orders_res_model.dart';
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
                  OrdersSingletone.instance.addOrders(
                    newOrders: res?.orders ?? [],
                    newMeta: res?.meta,
                  );
                  emit(
                    const OrdersState.initial(),
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
          pickFile: (
            context,
            fileType,
            imageSelection,
          ) async {
            emit(
              const OrdersState.loading(),
            );
            try {
              XFile? file = await selectFilesPath(
                context: context,
                fileType: fileType,
                imageSelection: imageSelection,
              );
              emit(
                OrdersState.filePicked(
                  file: file!,
                  fileType: fileType,
                  imageSelection: imageSelection,
                ),
              );
            } catch (e) {
              emit(
                OrdersState.pickFileFailure(
                  apiErrorModel: ApiErrorModel(
                    error: e.toString(),
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
                latitude: locationData?.latitude.toString() ?? '0.0',
                longitude: locationData?.longitude.toString() ?? '0.0',
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
                  OrdersSingletone.instance.addSingleOrder(
                    newOrder: order ?? Order(),
                  );
                  emit(
                    const OrdersState.success(),
                  );
                },
                failure: (apiErrorModel) async {
                  emit(
                    OrdersState.createOrderFailure(
                      apiErrorModel: apiErrorModel,
                    ),
                  );
                },
              );
            } catch (e) {
              emit(
                OrdersState.createOrderFailure(
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
                XFile? file = await pickMedia(
                  fileType: fileType,
                  source: ImageSource.camera,
                );
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
                XFile? file = await pickMedia(
                  fileType: fileType,
                  source: ImageSource.gallery,
                );
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

  Future<XFile?> pickMedia({
    required FileType fileType,
    required ImageSource source,
  }) async {
    if (fileType == FileType.image) {
      return await imagePicker.pickImage(
        source: source,
      );
    } else if (fileType == FileType.video) {
      return await imagePicker.pickVideo(
        source: source,
      );
    }
    return null;
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
      return LocationModel(latitude: 0.0, longitude: 0.0);
    }
  }
}
