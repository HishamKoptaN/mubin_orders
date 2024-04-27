import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/views/home.dart';
import 'temporary/navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'app/controllers/student_list.dart';
import 'app/theme/theme.dart';
import 'temporary/test_eight.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } on CameraException catch (e) {
    _logError(e.code, e.description);
  }
  // WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // Values.appDirectory = (await getExternalStorageDirectory());
  runApp(const MyApp());
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StudentListController());
    Get.put(StudentListControllerTwo());

    return GetMaterialApp(
      title: 'Student app',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}
