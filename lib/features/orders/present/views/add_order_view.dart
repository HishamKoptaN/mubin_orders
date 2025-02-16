import 'package:image_picker/image_picker.dart';
import '../../../../core/all_imports.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import '../../../add_order/views/widgets/text_field.dart';
import 'package:dio/dio.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({super.key});

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController orderIDController = TextEditingController();
  final TextEditingController clientIdController = TextEditingController();


  
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController videoController = TextEditingController();
  final TextEditingController firstImageController = TextEditingController();
  final TextEditingController secondImageController = TextEditingController();
  double? latitude;
  double? longitude;
  Uint8List? video;
  Uint8List? imageOne;
  Uint8List? imageTwo;
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
              
              videoPicked: (pickedVideo) =>  videoController.text = pickedVideo.path,
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
            state.maybeWhen(
                progress: (progress) => Column(
                      children: [
                        LinearProgressIndicator(
                          value: progress,
                        ),
                        Text(
                          "${(progress * 100).toStringAsFixed(0)}%",
                        ),
                      ],
                    ),
                orElse: () {},
                );
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
controller:placeNameController,
                    maxLines: 2,
                    labelText: t.place_hint,
                    hint: t.place_hint,
                  ),
                  MyTextField(
                    maxLines: 2,
                    onTap: () {
                      
                      context.read<OrdersBloc>().add(
                           OrdersEvent.pickFile(
context: context,

                            // source: ImageSource.camera,
                            fileType: FileType.image,
                            imageSelection: ImageSelection.first,
                          ),
                        );},
                    labelText: t.add_video,
                    hint: t.add_video,
                    suffixIcon: Icons.cloud_upload,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    maxLines: 2,
                      onTap: () {
                      
                      context.read<OrdersBloc>().add(
                           OrdersEvent.pickFile(
                            context: context,
                            // source: ImageSource.camera,
                            fileType: FileType.image,
                            imageSelection: ImageSelection.first,
                          ),
                        );},
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    maxLines: 2,
                        onTap: () {
                      context.read<OrdersBloc>().add(
                           OrdersEvent.pickFile(
                            context: context,
                            // source: ImageSource.camera,
                            fileType: FileType.image,
                            imageSelection: ImageSelection.second,
                          ),
                        );},
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  GestureDetector(
                    onTap: () async {
                        FormData formData = FormData.fromMap(
                            {
                              'client_id': clientIdController,
                              'place': placeNameController,
                              'image_one': MultipartFile.fromBytes(
                                imageOne!,
                                filename: 'prdouct_image.jpg',
                              ),
                               'image_two': MultipartFile.fromBytes(
                                imageTwo!,
                                filename: 'prdouct_image.jpg',
                              ), 'image': MultipartFile.fromBytes(
                                video!,
                                filename: 'prdouct_image.jpg',
                              ),
                            },
                          );
                      context.read<OrdersBloc>().add(
                            OrdersEvent.createOrder(
                            formData: formData
                            ),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
 
}




