import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/repo/orders_repo.dart';
import '../datasources/orders_api.dart';
import '../models/orders_res_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersApi postsApi;
  OrdersRepoImpl({
    required this.postsApi,
  });
  @override
  Future<ApiResult<OrdersResModel?>> getOrders() async {
    try {
      final res = await postsApi.getOrders();
      return ApiResult.success(
        data: res,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

 Future<ApiResult<Order?>> createOrder({
   required FormData formData,
  required Function(double) onProgress, // <-- إضافة دالة لاستقبال التقدم
}) async {
  try {
    final dio = Dio(); // إنشاء Dio
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.onSendProgress = (count, total) {
            double progress = (count / total);
            onProgress(progress); 
          };
          return handler.next(options);
        },
      ),
    );

    final res = await dio.post(
      ApiConstants.orders,
      data: formData,
    );

    return ApiResult.success(data: Order.fromJson(res.data));
  } catch (error) {
    return ApiResult.failure(apiErrorModel: ApiErrorHandler.handle(error: error));
  }
}

}

void isolateUploadFunction(SendPort sendPort) async {
  // استقبال البيانات من Main Isolate
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort); // إرسال SendPort للـ Main Isolate

  // استقبال البيانات عبر ReceivePort
  await for (var data in receivePort) {
    if (data is Map<String, dynamic>) {
      await performUpload(data, sendPort);
    }
  }
}


Future<void> performUpload(Map<String, dynamic> data, SendPort sendPort) async {
  Dio dio = Dio();

  // إعداد FormData مع الملفات
  FormData formData = FormData.fromMap({
    'client_id': data['clientId'],
    'place': data['place'],
    'image_one': MultipartFile.fromBytes(
      data['imageOne'],
      filename: 'product_image.jpg',
    ),
    'image_two': MultipartFile.fromBytes(
      data['imageTwo'],
      filename: 'product_image.jpg',
    ),
    'image': MultipartFile.fromBytes(
      data['video'],
      filename: 'product_image.jpg',
    ),
  });

  try {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.onSendProgress = (count, total) {
            double progress = (count / total) * 100;
            sendPort.send(progress); // إرسال التقدم إلى الـ Isolate الرئيسي
          };
          return handler.next(options);
        },
      ),
    );

    final res = await dio.post(
      'https://m-api.aquan.website/api/orders', // قم بتغيير هذا إلى عنوان API الخاص بك
      data: formData,
    );

    // إرسال الاستجابة إلى الـ Main Isolate
    sendPort.send(res.data);
  } catch (e) {
    // إرسال الخطأ إلى الـ Main Isolate
    sendPort.send('Error: $e');
  }
}
Future<void> runIsolateUpload(Map<String, dynamic> data) async {
  final receivePort = ReceivePort();

  // إرسال SendPort إلى الـ Isolate
  await Isolate.spawn(isolateUploadFunction, receivePort.sendPort);

  // استقبال SendPort من الـ Isolate
  final sendPort = await receivePort.first;

  // إرسال البيانات إلى الـ Isolate عبر SendPort
  sendPort.send(data);
}