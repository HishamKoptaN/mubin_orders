import 'package:flutter/material.dart';

import '../../main.dart';
import '../add_data/views/add_new_product.widget.dart';
import 'gloabal_widgets.dart';

class LoadingWIdget extends StatelessWidget {
  const LoadingWIdget({
    super.key,
    required this.width,
    required this.height,
    required this.text,
  });

  final double width;
  final double height;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          width: width / 1.25,
          height: height / 5,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyText(
                fieldName: text,
                color: Colors.white,
                fontSize: setFont(context, 13.5),
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
