import 'package:flutter/material.dart';
import 'package:mbean_talabat/global/media_query.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/constants.dart';
import '../../controllers/admin_products.controller.dart';
import 'admin_text_field.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({
    super.key,
    required this.controller,
  });
  final AdminProductsController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.screenHeight * 95,
        width: context.screenWidth * 95,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AdminTextField(
              controller: controller.orderIDController,
              maxLines: 2,
              labelText: S.of(context).order_id,
              hint: S.of(context).order_id,
            ),
            AdminTextField(
              controller: controller.placeNameController,
              labelText: S.of(context).order_place,
              hint: S.of(context).place_hint,
            ),
            AdminTextField(
              controller: controller.videoController,
              onTap: () => controller.selectVideoPath(),
              suffixIcon: Icons.cloud_upload,
              labelText: S.of(context).add_video,
              hint: S.of(context).add_video,
            ),
            AdminTextField(
              controller: controller.firstImageController,
              onTap: () => controller.selectFirstImagePath(),
              suffixIcon: Icons.cloud_upload,
              labelText: S.of(context).add_picure,
              hint: S.of(context).add_picure,
            ),
            AdminTextField(
              controller: controller.secondImageController,
              onTap: () => controller.selectSecondImagePath(),
              suffixIcon: Icons.cloud_upload,
              labelText: S.of(context).add_picure,
              hint: S.of(context).add_picure,
            ),
            GestureDetector(
              onTap: () async {
                await controller.addProduct();
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
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.fieldName,
    required this.fontSize,
    required this.color,
  });

  final double fontSize;
  final String fieldName;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      fieldName,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
    );
  }
}
