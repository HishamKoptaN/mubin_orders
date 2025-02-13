import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    super.key,
  });

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.green,
          color: Colors.white,
        ),
      ),
    );
  }
}
