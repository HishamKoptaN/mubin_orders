import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  MyText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      required String fieldName});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: fontSize,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
    );
  }
}

class MyTextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool isNumeric;
  final bool enabled;

  const MyTextInput({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.enabled,
    this.isNumeric = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125.w,
      height: 40.h,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          if (isNumeric && int.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          return null;
        },
      ),
    );
  }
}
