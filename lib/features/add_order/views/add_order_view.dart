import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';
import '../../../core/gloabal_widgets/loading_widget.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../bloc/order_state.dart';
import '../provider/add_order.controller.dart';
import 'widgets/text_field.dart';

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
                    S.of(context).order_added_successfully,
                  ),
                  duration: const Duration(seconds: 4),
                ),
              );
            }
            if (state is OrderAddedFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(S.of(context).order_addition_failed),
                  duration: const Duration(seconds: 4),
                ),
              );
            }
            if (state is OrderTimeout) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("S.of(context).request_timed_out"),
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
                text: S.of(context).request_saving,
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
                    labelText: S.of(context).client_id,
                    hint: S.of(context).client_id,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.placeNameController,
                    maxLines: 2,
                    labelText: S.of(context).place_hint,
                    hint: S.of(context).place_hint,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.videoController,
                    maxLines: 2,
                    onTap: () =>
                        adminProductsProvider.selectFilesPath(context, 0),
                    labelText: S.of(context).add_video,
                    hint: S.of(context).add_video,
                    suffixIcon: Icons.cloud_upload,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.firstImageController,
                    maxLines: 2,
                    onTap: () =>
                        adminProductsProvider.selectFilesPath(context, 1),
                    suffixIcon: Icons.cloud_upload,
                    labelText: S.of(context).add_picure,
                    hint: S.of(context).add_picure,
                    keyboardType: TextInputType.none,
                  ),
                  MyTextField(
                    controller: adminProductsProvider.secondImageController,
                    maxLines: 2,
                    onTap: () =>
                        adminProductsProvider.selectFilesPath(context, 2),
                    suffixIcon: Icons.cloud_upload,
                    labelText: S.of(context).add_picure,
                    hint: S.of(context).add_picure,
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
                          S.of(context).add,
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
