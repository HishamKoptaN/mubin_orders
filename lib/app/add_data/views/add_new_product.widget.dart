import 'package:flutter/material.dart';
import 'package:mbean_talabat/global/media_query.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import '../../../global/constants.dart';
import '../../gloabal_widgets/gloabal_widgets.dart';
import '../../gloabal_widgets/loading_widget.dart';
import '../provider/admin_products.controller.dart';
import 'widgets/admin_text_field.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final homeController =
        Provider.of<AdminProductsProvider>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: context.screenHeight * 95,
              width: context.screenWidth * 95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Selector<AdminProductsProvider, TextEditingController>(
                    selector: (context, provider) => provider.videoController,
                    builder: (context, value, child) {
                      return AdminTextField(
                        controller: homeController.orderIDController,
                        maxLines: 2,
                        labelText: S.of(context).order_id,
                        hint: S.of(context).order_id,
                      );
                    },
                  ),
                  Selector<AdminProductsProvider, TextEditingController>(
                    selector: (context, provider) =>
                        provider.placeNameController,
                    builder: (context, value, child) {
                      return AdminTextField(
                        controller: homeController.placeNameController,
                        maxLines: 2,
                        labelText: S.of(context).order_place,
                        hint: S.of(context).place_hint,
                      );
                    },
                  ),
                  Selector<AdminProductsProvider, TextEditingController>(
                    selector: (context, provider) => provider.videoController,
                    builder: (context, value, child) {
                      return AdminTextField(
                        controller: homeController.videoController,
                        maxLines: 2,
                        onTap: () => homeController.selectFilesPath(context, 0),
                        labelText: S.of(context).add_video,
                        hint: S.of(context).add_video,
                        suffixIcon: Icons.cloud_upload,
                        keyboardType: TextInputType.none,
                      );
                    },
                  ),
                  Selector<AdminProductsProvider, TextEditingController>(
                    selector: (context, provider) =>
                        provider.firstImageController,
                    builder: (context, value, child) {
                      return AdminTextField(
                        controller: homeController.firstImageController,
                        maxLines: 2,
                        onTap: () => homeController.selectFilesPath(context, 1),
                        suffixIcon: Icons.cloud_upload,
                        labelText: S.of(context).add_picure,
                        hint: S.of(context).add_picure,
                        keyboardType: TextInputType.none,
                      );
                    },
                  ),
                  Selector<AdminProductsProvider, TextEditingController>(
                    selector: (context, provider) =>
                        provider.secondImageController,
                    builder: (context, value, child) {
                      return AdminTextField(
                        controller: homeController.secondImageController,
                        maxLines: 2,
                        onTap: () => homeController.selectFilesPath(context, 2),
                        suffixIcon: Icons.cloud_upload,
                        labelText: S.of(context).add_picure,
                        hint: S.of(context).add_picure,
                        keyboardType: TextInputType.none,
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      await homeController.addProduct(context);
                    },
                    child: Container(
                      height: context.screenHeight * 5,
                      width: context.screenWidth * 25,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyText(
                            fieldName: S.of(context).add,
                            fontSize: context.screenSize * fiveFont,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Selector<AdminProductsProvider, bool>(
              selector: (_, provider) => provider.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return LoadingWIdget(
                    width: width,
                    height: height,
                    text: S.of(context).request_saving,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
