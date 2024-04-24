import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'app/navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'student_app/app/controllers/student_list.dart';
import 'student_app/app/db/students.dart';
import 'student_app/app/global/values.dart';
import 'student_app/app/theme/theme.dart';

late bool isDarkMode;
List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // Get dark mode setting
  isDarkMode = await StudentDatabase.instance.getDarkMode();
  // Set app directory
  Values.appDirectory = (await getExternalStorageDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StudentListController());

    return GetMaterialApp(
        title: 'Student app',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const NavigateBarScreen());
  }
}
