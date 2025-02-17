import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:tbib_file_uploader/tbib_file_uploader.dart' as tbib_file_uploader;
import '../../../../core/all_imports.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import '../../../../core/widgets/text_field.dart';
import 'package:dio/dio.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({super.key});

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  Uint8List? imageOneFile;
  Uint8List? video;
  Uint8List? imageOne;
  Uint8List? imageTwo;
  final TextEditingController clientIdController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController videoController = TextEditingController();
  final TextEditingController imageOneController = TextEditingController();
  final TextEditingController imageTwoController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

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
              imagePicked: (
                file,
                fileType,
                pickedVideo,
              ) async {
                if (fileType == FileType.video) {
                  video = await file.readAsBytes();
                  videoController.text = file.path;
                } else {
                  if (pickedVideo == ImageSelection.first) {
                    imageOne = await file.readAsBytes();
                    imageOneController.text = file.path;
                  } else if (pickedVideo == ImageSelection.second) {
                    imageTwo = await file.readAsBytes();
                    imageTwoController.text = file.path;
                  }
                }
              },
              failure: (e) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(t.order_addition_failed),
                  duration: const Duration(seconds: 4),
                ),
              ),
            );
          },
          builder: (context, state) {
            return
                // في شاشة إضافة الطلب:
                state.maybeWhen(
              progress: (progress) {
                return Column(
                  children: [
                    LinearProgressIndicator(value: progress),
                    Text("${(progress * 100).toStringAsFixed(0)}%"),
                  ],
                );
              },
              orElse: () {
                return Stack(
                  children: [
                    BlocBuilder<OrdersBloc, OrdersState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      initial: () => const SizedBox.shrink(),
                      uploading: (progress) =>
                          LinearProgressIndicator(value: progress),
                      success: () => const SizedBox.shrink(),
                      failure: (error) => const SizedBox.shrink(), orElse: () { return SizedBox(); },
                    );
                  },
                ),
                     ElevatedButton(
                  onPressed: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      File imageFile = File(pickedFile.path);
                      
                      context
                          .read<OrdersBloc>()
                          .add(OrdersEvent.uploadImage(imageFile));
                    }
                  },
                  child: const Text("Pick Image and Upload"),
                ),
                    state.maybeWhen(
                      progress: (progress) {
                        return Column(
                          children: [
                            LinearProgressIndicator(
                              value: progress,
                            ),
                            Text(
                              "${(progress * 100).toStringAsFixed(0)}%",
                            ),
                          ],
                        );
                      },
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
//  Response<Map<String, dynamic>>? dataApi =
//                                 await tbib_file_uploader.TBIBFileUploader()
//                                     .startUploadFileWithResponse(
//                               dio: Dio(
//                                 BaseOptions(
//                                   baseUrl: 'https://api.escuelajs.co/api/v1/',
//                                 ),
//                               ),
//                               pathApi: 'files/upload',
//                               method: 'POST',
//                               yourData: FormData.fromMap(
//                                 {
//                                   'file': MultipartFile.fromBytes(
//                   imageOne!,

//                                   )
                                  
                                  
//                                 },
//                               ),
//                             );
                                  // FormData formData = FormData.fromMap(
                                  //   {
                                  //     'client_id': clientIdController,
                                  //     'place': placeNameController,
                                  //     'image_one': MultipartFile.fromBytes(
                                  //       imageOne!,
                                  //       filename: 'prdouct_image.jpg',
                                  //     ),
                                  //     'image_two': MultipartFile.fromBytes(
                                  //       imageTwo!,
                                  //       filename: 'prdouct_image.jpg',
                                  //     ),
                                  //     'image': MultipartFile.fromBytes(
                                  //       video!,
                                  //       filename: 'prdouct_image.jpg',
                                  //     ),
                                  //   },
                                  // );
                                  // context.read<OrdersBloc>().add(
                                  //       OrdersEvent.createOrder(
                                  //         formData: formData,
                                  //       ),
                                  //     );
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
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
