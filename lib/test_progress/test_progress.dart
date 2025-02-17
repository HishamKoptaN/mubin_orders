import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'api_service.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  double progress = 0.0;

  void pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);

      FileUploader().uploadFile(file, (double progressValue) {
        setState(() {
          progress = progressValue;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("رفع ملف مع متابعة التقدم")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: pickAndUploadFile,
            child: Text("اختر ملف"),
          ),
          SizedBox(height: 20),
          LinearProgressIndicator(value: progress),
          SizedBox(height: 10),
          Text("${(progress * 100).toStringAsFixed(0)}%"),
        ],
      ),
    );
  }
}
