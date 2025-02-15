import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/gloabal_widgets/loading_widget.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../bloc/order_state.dart';
import '../provider/add_order.controller.dart';
import 'widgets/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        create: (_) => OrderBloc(),
        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state is OrdersAddedSuccessfully) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    t.order_added_successfully,
                  ),
                  duration: const Duration(seconds: 4),
                ),
              );
            }
            if (state is OrderAddedFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(t.order_addition_failed),
                  duration: const Duration(seconds: 4),
                ),
              );
            }
            if (state is OrderTimeout) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("S.of(context).request_time_out"),
                  duration: Duration(seconds: 4),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is OrderLoading || state is OrderProgress) {
              double progress = state is OrderProgress ? state.progress : 0.0;
              return LoadingWidget(
                height: height,
                width: width,
                text: t.order_saving,
                progress: progress,
              );
            }
            // return LoadingWidget(
            //   height: height,
            //   width: width,
            //   text: S.of(context).request_saving,
            //   progress: 100,
            // );
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
                    onTap: () =>
                        adminProductsProvider.selectFilesPath(context:context,file:  0,),
                    labelText: t.add_video,
                    hint: t.add_video,
                    suffixIcon: Icons.cloud_upload,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.firstImageController,
                    maxLines: 2,
                    onTap: () =>
                        adminProductsProvider.selectFilesPath(context:context,file: 1,
                        ),
                    suffixIcon: Icons.cloud_upload,
                    labelText: t.add_picure,
                    hint: t.add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.secondImageController,
                    maxLines: 2,
                    onTap: () =>
                        adminProductsProvider.selectFilesPath(context:context,file: 2,
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
