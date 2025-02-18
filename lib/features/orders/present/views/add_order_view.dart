import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../core/all_imports.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import '../../../../core/widgets/text_field.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({super.key});

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final TextEditingController clientIdController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  XFile? video;
  XFile? imageOne;
  XFile? imageTwo;
  final TextEditingController videoController = TextEditingController();
  final TextEditingController imageOneController = TextEditingController();
  final TextEditingController imageTwoController = TextEditingController();
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocProvider(
        create: (_) => OrdersBloc(
          getOrdersUseCase: getIt(),
          createOrderUseCase: getIt(),
        ),
        child: BlocConsumer<OrdersBloc, OrdersState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    t.order_added_successfully,
                  ),
                  duration: const Duration(seconds: 4),
                ),
              ),
              filePicked: (
                file,
                fileType,
                imageSelection,
              ) async {
                if (fileType == FileType.video) {
                  video = file;
                  videoController.text = file.path;
                } else {
                  if (imageSelection == ImageSelection.first) {
                    imageOne = file;
                    imageOneController.text = file.path;
                  } else if (imageSelection == ImageSelection.second) {
                    imageTwo = file;
                    imageTwoController.text = file.path;
                  }
                }
              },
              pickFileFailure: (e) =>
                  ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    t.file_pick_failed,
                  ),
                  duration: const Duration(seconds: 4),
                ),
              ),
              createOrderFailure: (e) =>
                  ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    t.order_addition_failed,
                  ),
                  duration: const Duration(seconds: 4),
                ),
              ),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTextField(
                        controller: clientIdController,
                        maxLines: 2,
                        labelText: t.client_id,
                        hint: t.client_id,
                      ),
                      MyTextField(
                        controller: placeNameController,
                        maxLines: 2,
                        labelText: t.place_hint,
                        hint: t.place_hint,
                      ),
                      MyTextField(
                        controller: videoController,
                        maxLines: 2,
                        onTap: () {
                          context.read<OrdersBloc>().add(
                                OrdersEvent.pickFile(
                                  context: context,
                                  fileType: FileType.video,
                                  imageSelection: ImageSelection.first,
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
                        onTap: () {
                          context.read<OrdersBloc>().add(
                                OrdersEvent.pickFile(
                                  context: context,
                                  fileType: FileType.image,
                                  imageSelection: ImageSelection.first,
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
                        onTap: () {
                          context.read<OrdersBloc>().add(
                                OrdersEvent.pickFile(
                                  context: context,
                                  fileType: FileType.image,
                                  imageSelection: ImageSelection.second,
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
                          state.maybeWhen(
                            uploading: (p) {},
                            orElse: () {
                              context.read<OrdersBloc>().add(
                                    OrdersEvent.createOrder(
                                      clientId: clientIdController.text,
                                      placeName: placeNameController.text,
                                      video: File(video!.path),
                                      imageOne: File(imageOne!.path),
                                      imageTwo: File(imageTwo!.path),
                                    ),
                                  );
                            },
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
                      state.maybeWhen(
                        uploading: (progress) {
                          double? parsedProgress = double.tryParse(progress);
                          if (parsedProgress != null) {
                            return Center(
                              child: Column(
                                children: [
                                  LinearProgressIndicator(
                                    value: parsedProgress,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    progress,
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Center(
                              child: Column(
                                children: [
                                  LinearProgressIndicator(
                                    value: parsedProgress,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    progress,
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        orElse: () {
                          return SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
