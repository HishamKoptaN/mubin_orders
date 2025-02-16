import 'package:image_picker/image_picker.dart';
import '../../../../core/all_imports.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import '../../../add_order/views/widgets/text_field.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({super.key});

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
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
              progress:(progress)=> Column(
        children: [
          LinearProgressIndicator(value: progress,), 
          Text("${(progress * 100).toStringAsFixed(0)}%",),
        ],
      ),
              orElse: (){}
              );
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyTextField(
                    onChanged:(v){},
                    maxLines: 2,
                    labelText: t.client_id,
                    hint: t.client_id,
                  ),
                  MyTextField(
                   onChanged:(v){},
                    maxLines: 2,
                    labelText: t.place_hint,
                    hint: t.place_hint,
                  ),
                  MyTextField(
                   onChanged:(v){},
                    maxLines: 2,
                    onTap: () =>context.read<OrdersBloc>().add(
      const OrdersEvent.pickImage(
        source: ImageSource.camera,
        type: CaptureType.imageOne,
      ),
    ),
                    labelText: t.add_video,
                    hint: t.add_video,
                    suffixIcon: Icons.cloud_upload,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                  onChanged:(v){},
                    maxLines: 2,
                      onTap: () =>context.read<OrdersBloc>().add(
      const OrdersEvent.pickImage(
        source: ImageSource.camera,
        type: CaptureType.imageTwo,
      ),
    ),
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                   onChanged:(v){},
                    maxLines: 2,
                   onTap: () =>context.read<OrdersBloc>().add(
      const OrdersEvent.pickVideo(
        source: ImageSource.camera,
      ),
    ),
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // context.read<OrderBloc>().add(
                      //       AddOrderEvent(
                      //         clientId:
                      //             adminProductsProvider.clientIdController.text,
                      //         place: adminProductsProvider
                      //             .placeNameController.text,
                      //         video: adminProductsProvider.pickedVideo!,
                      //         imageOne: adminProductsProvider.pickedFirstImage!,
                      //         imageTwo:
                      //             adminProductsProvider.pickedSecondImage!,
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
      ),
    );
  }
}








   // if (state is OrderLoading || state is OrderProgress) {
            //   double progress = state is OrderProgress ? state.progress : 0.0;
            //   return LoadingWidget(
            //     height: height,
            //     width: width,
            //     text: t.order_saving,
            //     progress: progress,
            //   );
            // }
            // return LoadingWidget(
            //   height: height,
            //   width: width,
            //   text: t.request_saving,
            //   progress: 100,
            // );