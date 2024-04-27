import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'app/views/home.dart';
import 'temporary/navigator_bottom_bar/navigator_bottom_bar_view.dart';
import 'app/controllers/student_list.dart';
import 'app/theme/theme.dart';
import 'temporary/test_eight.dart';
=======
import 'temporary/student_app/app/controllers/student_list.dart';
import 'temporary/student_app/app/db/students.dart';
import 'temporary/student_app/app/global/values.dart';
import 'temporary/student_app/app/theme/theme.dart';
import 'temporary/student_app/app/views/home.dart';
import 'temporary/student_app/app/views/home_controller.dart';
>>>>>>> b5ae0e21db00783d1fd37245ed18efc151e220bf

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } on CameraException catch (e) {
    _logError(e.code, e.description);
  }
<<<<<<< HEAD
  // WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // Values.appDirectory = (await getExternalStorageDirectory());
  runApp(const MyApp());
=======
  cameras = await availableCameras();
  // Get dark mode setting
  isDarkMode = await StudentDatabase.instance.getDarkMode();
  // Set app directory
  Values.appDirectory = (await getExternalStorageDirectory());
  HomeController homeController = Get.put(HomeController());
  runApp(GetMaterialApp(home: HomePage()));
>>>>>>> b5ae0e21db00783d1fd37245ed18efc151e220bf
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}
<<<<<<< HEAD

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
=======
>>>>>>> b5ae0e21db00783d1fd37245ed18efc151e220bf
