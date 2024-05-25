import 'package:flutter/material.dart';
import '../../../main.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.fieldName,
    required this.color,
  });

  final String fieldName;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fieldName,
        style: TextStyle(
            fontSize: setFont(context, 14),
            fontWeight: FontWeight.bold,
            color: color),
      ),
    );
  }
}
