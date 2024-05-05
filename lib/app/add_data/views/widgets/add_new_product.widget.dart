import 'package:flutter/material.dart';
import 'package:mbean_admin/helpers/media_query.dart';
import '../../../../helpers/constants.dart';
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
              labelText: 'رقم الطلب',
              hint: 'ادخل رقم الطلب',
            ),
            AdminTextField(
              controller: controller.placeNameController,
              labelText: 'اسم المكان',
              hint: 'مدرسه/مسجد/قريه',
            ),
            AdminTextField(
              controller: controller.videoController,
              onTap: () => controller.pickVideoCamera(),
              suffixIcon: Icons.cloud_upload,
              labelText: 'اضافة فيديو ',
              hint: 'ارفق فيديو',
            ),
            AdminTextField(
              controller: controller.firstImageController,
              onTap: () => controller.pickFirstImageCamera(),
              suffixIcon: Icons.cloud_upload,
              labelText: 'اضافة صوره ',
              hint: 'ارفق صوره',
            ),
            AdminTextField(
              controller: controller.secondImageController,
              onTap: () => controller.pickSecondImageCamera(),
              suffixIcon: Icons.cloud_upload,
              labelText: 'اضافة صوره ',
              hint: 'ارفق صوره',
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
                      fieldName: 'اضافة',
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
