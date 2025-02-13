import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double progress;

  const LoadingWidget({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.h,
        width: 200.w,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150.w,
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white,
                color: Colors.blue,
                minHeight: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
