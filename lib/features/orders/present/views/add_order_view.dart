import '../../../../core/all_imports.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_state.dart';
import '../../../add_order/bloc/order_bloc.dart';
import '../../../add_order/bloc/order_event.dart';
import '../../../add_order/provider/add_order.controller.dart';
import '../../../add_order/views/widgets/text_field.dart';

class AddOrderView extends StatefulWidget {
  const AddOrderView({super.key});

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final AddOrderController adminProductsProvider = AddOrderController();
  double _progress = 0.0;

  void _handleUploadProgress(double progress) {
    setState(
      () {
        _progress = progress;
      },
    );
  }

  @override
  Widget build(context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocProvider(
        create: (_) => OrdersBloc(
          getOrdersUseCase: getIt(),
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyTextField(
                    controller: adminProductsProvider.clientIdController,
                    maxLines: 2,
                    labelText: t.client_id,
                    hint: t.client_id,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.placeNameController,
                    maxLines: 2,
                    labelText: t.place_hint,
                    hint: t.place_hint,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.videoController,
                    maxLines: 2,
                    onTap: () => adminProductsProvider.selectFilesPath(
                      t: t,
                      context: context,
                      file: 0,
                    ),
                    labelText: t.add_video,
                    hint: t.add_video,
                    suffixIcon: Icons.cloud_upload,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.firstImageController,
                    maxLines: 2,
                    onTap: () => adminProductsProvider.selectFilesPath(
                      t: t,
                      context: context,
                      file: 1,
                    ),
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.secondImageController,
                    maxLines: 2,
                    onTap: () => adminProductsProvider.selectFilesPath(
                      t: t,
                      context: context,
                      file: 2,
                    ),
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  GestureDetector(
                    onTap: () async {
                      context.read<OrderBloc>().add(
                            AddOrderEvent(
                              clientId:
                                  adminProductsProvider.clientIdController.text,
                              place: adminProductsProvider
                                  .placeNameController.text,
                              video: adminProductsProvider.pickedVideo!,
                              imageOne: adminProductsProvider.pickedFirstImage!,
                              imageTwo:
                                  adminProductsProvider.pickedSecondImage!,
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