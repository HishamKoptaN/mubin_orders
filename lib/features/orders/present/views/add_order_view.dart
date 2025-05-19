import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import '../../../../core/all_imports.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import '../../../../core/widgets/text_field.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({
    super.key,
  });
  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController clientIdController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  XFile? video;
  XFile? imageOne;
  XFile? imageTwo;
  final TextEditingController videoController = TextEditingController();
  final TextEditingController imageOneController = TextEditingController();
  final TextEditingController imageTwoController = TextEditingController();
  Future<File?> selectFilesPath({
    required BuildContext context,
    required FileType fileType,
  }) async {
    final t = AppLocalizations.of(context)!;
    final XFile? picked = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(t.select_files),
          actions: [
            IconsOutlineButton(
              onPressed: () async {
                final xFile = await pickMedia(
                  fileType: fileType,
                  source: ImageSource.camera,
                );
                Navigator.of(context).pop(xFile);
              },
              text: t.camera,
              iconData: CupertinoIcons.camera_fill,
              color: AppColors.greenColor,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            IconsOutlineButton(
              onPressed: () async {
                final xFile = await pickMedia(
                  fileType: fileType,
                  source: ImageSource.gallery,
                );
                Navigator.of(context).pop(xFile);
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
    if (picked != null) {
      return File(picked.path);
    }
    return null;
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    context,
  ) {
    final t = AppLocalizations.of(context)!;
    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (
        context,
        state,
      ) {
        state.whenOrNull(
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  t.order_added_successfully,
                ),
                duration: const Duration(
                  seconds: 4,
                ),
              ),
            );
          },
          failure: (
            e,
          ) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  e.error ?? t.order_addition_failed,
                ),
                duration: const Duration(seconds: 4),
              ),
            );
          },
        );
      },
      builder: (
        context,
        state,
      ) {
        return state.maybeWhen(
          loaded: (
            orders,
            hasMore,
            addOrderReqModel,
            uploadingProgress,
          ) {
            double? parsedProgress = double.tryParse(
              uploadingProgress ?? '',
            );
            videoController.text = addOrderReqModel?.video?.path ?? '';
            imageOneController.text = addOrderReqModel?.imageOne?.path ?? '';
            imageTwoController.text = addOrderReqModel?.imageTwo?.path ?? '';
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyTextField(
                    controller: clientIdController,
                    onChanged: (
                      v,
                    ) async {
                      context.read<OrdersBloc>().add(
                            OrdersEvent.updateData(
                              addOrderReqModel: addOrderReqModel!.copyWith(
                                clientId: v,
                              ),
                            ),
                          );
                    },
                    maxLines: 2,
                    labelText: t.client_id,
                    hint: t.client_id,
                  ),
                  MyTextField(
                    controller: placeNameController,
                    onChanged: (
                      v,
                    ) async {
                      context.read<OrdersBloc>().add(
                            OrdersEvent.updateData(
                              addOrderReqModel: addOrderReqModel!.copyWith(
                                placeName: v,
                              ),
                            ),
                          );
                    },
                    maxLines: 2,
                    labelText: t.place_hint,
                    hint: t.place_hint,
                  ),
                  MyTextField(
                    controller: videoController,
                    maxLines: 2,
                    onTap: () async {
                      context.read<OrdersBloc>().add(
                            OrdersEvent.updateData(
                              addOrderReqModel: addOrderReqModel!.copyWith(
                                video: await selectFilesPath(
                                  context: context,
                                  fileType: FileType.video,
                                ),
                              ),
                            ),
                          );
                    },
                    labelText: t.add_video,
                    hint: t.add_video,
                    suffixIcon: Icons.cloud_upload,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: imageOneController,
                    maxLines: 2,
                    onTap: () async {
                      context.read<OrdersBloc>().add(
                            OrdersEvent.updateData(
                              addOrderReqModel: addOrderReqModel!.copyWith(
                                imageOne: await selectFilesPath(
                                  context: context,
                                  fileType: FileType.image,
                                ),
                              ),
                            ),
                          );
                    },
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: imageTwoController,
                    maxLines: 2,
                    onTap: () async {
                      context.read<OrdersBloc>().add(
                            OrdersEvent.updateData(
                              addOrderReqModel: addOrderReqModel!.copyWith(
                                imageTwo: await selectFilesPath(
                                  context: context,
                                  fileType: FileType.image,
                                ),
                              ),
                            ),
                          );
                    },
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  GestureDetector(
                    onTap: () async {
                      context.read<OrdersBloc>().add(
                            OrdersEvent.createOrder(),
                          );
                    },
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          t.add,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (parsedProgress != null)
                    Center(
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            value: parsedProgress,
                            color: Colors.green,
                          ),
                          Text(
                            uploadingProgress ?? 'uploadingProgress',
                          )
                        ],
                      ),
                    )
                  else
                    SizedBox.shrink(),
                ],
              ),
            );
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }
}
