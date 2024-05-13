import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
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
