import 'dart:io';
import 'package:dio/dio.dart';

class FileUploader {
  final Dio dio = Dio();

  Future<void> uploadFile(File file, Function(double) onProgress) async {
    String url = "https://m-api.aquan.website/api/orders"; // استبدل بعنوان الـ API

    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      });

      await dio.post(
        url,
        data: formData,
        onSendProgress: (int sent, int total) {
          double progress = sent / total;
          onProgress(progress); // تحديث نسبة التقدم
        },
      );

      print("تم الرفع بنجاح!");
    } catch (e) {
      print("خطأ أثناء الرفع: $e");
    }
  }
}
