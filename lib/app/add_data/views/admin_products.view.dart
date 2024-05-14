import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_talabat/global/constants.dart';
import 'package:mbean_talabat/global/media_query.dart';
import '../controllers/admin_products.controller.dart';
import 'widgets/add_new_product.widget.dart';

class AdminProductsView extends GetView<AdminProductsController> {
  const AdminProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminProductsController());
    return Scaffold(
      body: GetBuilder<AdminProductsController>(
        init: AdminProductsController(),
        builder: (cnr) {
          return cnr.isLoadIng
              ? Center(
                  child: Column(
                    children: [
                      const Spacer(flex: 5),
                      const CircularProgressIndicator(
                        color: Colors.green,
                      ),
                      const Spacer(flex: 1),
                      MyText(
                          fieldName: 'جاري رفع الطلب',
                          fontSize: context.screenSize * fiveFont,
                          color: Colors.black),
                      const Spacer(flex: 4),
                    ],
                  ),
                )
              : AddNewProduct(
                  controller: controller,
                );
        },
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
    return Center(
      child: Text(
        fieldName,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
