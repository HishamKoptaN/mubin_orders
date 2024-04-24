
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controllers/order_list.dart';
// import 'db/orders_data_base.dart';
// import 'app/navigator_bottom_bar/navigator_bottom_bar_view.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:path_provider/path_provider.dart';
// import 'global/values.dart';

// List<CameraDescription> cameras = [];
// late bool isDarkMode;
// Future<void> main() async {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//   } on CameraException catch (e) {
//     _logError(e.code, e.description);
//   }
//   cameras = await availableCameras();
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();
//   // Get dark mode setting
//   isDarkMode = await OrderDatabase.instance.getDarkMode();
//   // Set app directory
//   Values.appDirectory = (await getExternalStorageDirectory());
//   runApp(
//     MyApp(),
//   );
// }

// void _logError(String code, String? message) {
//   // ignore: avoid_print
//   print('Error: $code${message == null ? '' : '\nError Message: $message'}');
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       themeMode: ThemeMode.dark,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.black,
//         scaffoldBackgroundColor: Colors.blueGrey.shade900,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//       ),
//       home: const NavigateBarScreen(),
//     );
//   }
// }