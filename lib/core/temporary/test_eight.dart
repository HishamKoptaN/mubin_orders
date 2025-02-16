// import 'dart:io';
// import 'package:docs_orders/helpers/media_query.dart';
// import 'package:dough/dough.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
// import '../../../../helpers/constants.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// // import 'package:video_player/video_player.dart';

// class HomePageTwo extends StatelessWidget {
//   HomePageTwo({super.key});
//   HomeControllerTwo homeController = Get.put(HomeControllerTwo());
//   @override
//   Widget build(BuildContext context) {
//     RxString searchString = "".obs;
//     return GetBuilder<HomeControllerTwo>(
//       init: HomeControllerTwo(),
//       builder: (cnr) {
//         return Scaffold(
//           floatingActionButton: GestureDetector(
//             onTap: () {
//               cnr.defaultDial();
//             },
//             child: Container(
//               height: context.screenHeight * 8,
//               width: context.screenWidth * 50,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 34, 137, 11),
//                 border: Border.all(),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(15),
//                 ),
//               ),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Icon(
//                       Icons.camera_alt_outlined,
//                       color: Colors.black,
//                       size: 30,
//                     ),
//                     MyText(
//                       fieldName: 'اضافة فيديو',
//                       fontSize: context.screenSize * sixFont,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           appBar: AppBar(
//             actions: [
//               const Spacer(),
//               MyText(
//                 fontSize: context.screenSize * eightFont,
//                 fieldName: 'الرئيسيه',
//               ),
//               const Spacer(),
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Flex(
//               direction: Axis.vertical,
//               children: [
//                 // Search bar
//                 // StudentSearchBar(
//                 //   onSearch: (query) {
//                 //     searchString.value = query;
//                 //   },
//                 // ),
//                 // List of students
//                 Obx(
//                   () => FutureBuilder(
//                     future: OrderDatabaseTwo.instance
//                         .getStudents(searchString.value),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         // Set students to controller
//                         Get.find<StudentListControllerTwo>()
//                             .setStudents(snapshot.data!);
//                         // Otherwise, return list of students
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Obx(
//                             () => Get.find<StudentListControllerTwo>().count > 0
//                                 ? StaggeredGridView.countBuilder(
//                                     crossAxisCount: 1,
//                                     crossAxisSpacing: 16,
//                                     shrinkWrap: true,
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     itemCount:
//                                         Get.find<StudentListControllerTwo>()
//                                             .count,
//                                     itemBuilder: (context, index) {
//                                       // Return student card
//                                       return StudentCard(
//                                         student:
//                                             Get.find<StudentListControllerTwo>()
//                                                 .at(index),
//                                         onDelete: (student) {
//                                           showDeleteConfirmation(student);
//                                         },
//                                       );
//                                     },
//                                     staggeredTileBuilder: (int index) =>
//                                         const StaggeredTile.fit(1))
//                                 : const SizedBox(
//                                     height: 50,
//                                     child: Center(
//                                       child: Text("No vedios found"),
//                                     ),
//                                   ),
//                           ),
//                         );
//                       }

//                       return SizedBox(
//                         height: MediaQuery.of(context).size.height - 200,
//                         child: const Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   /// Show a dialog to confirm the deletion of a student
//   void showDeleteConfirmation(Student order) {
//     showCustomDialog(
//       "مسح فيديو",
//       "هل انت متأكد من مسح الفيديو?",
//       [
//         TextButton(
//           onPressed: () {
//             Get.back();
//           },
//           child: const Text("الغاء"),
//         ),
//         TextButton(
//           onPressed: () async {
//             // Close dialog
//             Get.back();

//             // Check if student has an id
//             if (order.id == null) {
//               showDeleteError();
//               return;
//             }

//             // Delete student from database
//             await OrderDatabaseTwo.instance.deleteOrder(order);
//             // Delete student from list
//             Get.find<StudentListControllerTwo>().deleteStudent(order);
//             // Delete student image
//             await File("${Values.appDirectory!.path}/${order.firstImage}")
//                 .delete();
//           },
//           child: const Text("مسح"),
//         ),
//       ],
//     );
//   }

//   /// Show an error dialog when an error occured during deleting a student
//   void showDeleteError() {
//     showCustomDialog(
//       "خطأ",
//       'حدث خطأ اثناء مسح الفيديو',
//       [
//         TextButton(
//           style: TextButton.styleFrom(
//               foregroundColor: Get.theme.colorScheme.onErrorContainer),
//           onPressed: () {
//             Get.back();
//           },
//           child: const MyText(fieldName: 'اوك', fontSize: 15),
//         ),
//       ],
//     );
//   }
// }

// class MyText extends StatelessWidget {
//   const MyText({
//     super.key,
//     required this.fieldName,
//     required this.fontSize,
//   });

//   final double fontSize;
//   final String fieldName;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       fieldName,
//       style: TextStyle(
//           fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
//     );
//   }
// }

// class HomeControllerTwo extends GetxController {
//   final TextEditingController palaceController = TextEditingController();
//   late File? _videoFile;
//   final RxString imagePath = "".obs;
//   final RxString course = "".obs;

//   void defaultDial() {
//     Get.defaultDialog(
//       title: "المكان",
//       backgroundColor: Colors.green,
//       titleStyle: const TextStyle(color: Colors.white),
//       middleTextStyle: const TextStyle(color: Colors.white),
//       content: SizedBox(
//         width: 250,
//         height: 100,
//         child: Column(
//           children: [
//             const Spacer(),
//             Container(
//               width: 350,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(15),
//                 ),
//               ),
//               child: TextField(
//                 controller: palaceController,
//                 style: const TextStyle(fontSize: 20, color: Colors.black),
//               ),
//             ),
//             const Spacer(
//               flex: 4,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: const Text(
//                     'الغاء',
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 154, 22, 13), fontSize: 25),
//                   ),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     palaceController.text == ''
//                         ? addPalaceSnackBar('ادخل المكان')
//                         : recordVideo();
//                   },
//                   child: const Text(
//                     'تأكيد',
//                     style: TextStyle(color: Colors.black, fontSize: 25),
//                   ),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }

//   void addPalaceSnackBar(String message) {
//     Get.showSnackbar(
//       GetSnackBar(
//         backgroundColor: Colors.red,
//         dismissDirection: DismissDirection.up,
//         message: message,
//         duration: const Duration(seconds: 3),
//       ),
//     );
//   }

//   Future<void> recordVideo() async {
//     final pickedFile =
//         await ImagePicker().pickVideo(source: ImageSource.camera);
//     if (pickedFile != null) {
//       _videoFile = File(pickedFile.path);
//       update();
//     }
//     addorder('place', pickedFile!.path, '', '', 123, 456);
//   }

//   Future<void> addorder(String place, String video, String firstImage,
//       String secondImage, double latitude, double longitude) async {
//     try {
//       place = place.trim();
//       _clearImageCache();
//       Student student = Student(
//         id: 4,
//         place: place,
//         video: video,
//         firstImage: firstImage,
//         secondImage: secondImage,
//         latitude: latitude,
//         longitude: longitude,
//       );
//       student.id = await OrderDatabaseTwo.instance.addOrder(student);
//       Get.find<StudentListControllerTwo>().addStudent(student);
//       Get.back();
//       showSuccess(student.firstImage!);
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _clearImageCache() {
//     if (imagePath.isEmpty) return;
//     File(imagePath.value).parent.delete(recursive: true);
//     imagePath.value = "";
//   }

//   void showSuccess(String name) {
//     showCustomDialog(
//       "Success",
//       "$name added successfully!",
//       [
//         TextButton(
//           onPressed: () {
//             // Clear inputs
//             _clearInputs();
//             // Close this dialog
//             Get.back();
//           },
//           child: const Text("غلق"),
//         ),
//         // TextButton(
//         //     onPressed: () {
//         //       // Close this dialog
//         //       Get.back();
//         //       // Close current page
//         //       Get.back();
//         //     },
//         //     child: const Text(""))
//       ],
//     );
//   }

//   void _clearInputs() {
//     imagePath.value = "";
//     palaceController.clear();
//     course.value = "";
//   }
// }

// class StudentCard extends StatelessWidget {
//   StudentCard({Key? key, required this.student, required this.onDelete})
//       : super(key: key);

//   final Student student;
//   final Function(Student) onDelete;
//   late File? _videoFile;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OrderController>(
//       init: OrderController(),
//       builder: (cnr) {
//         return PressableDough(
//           child: Card(
//             semanticContainer: true,
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             color: Get.theme.brightness == Brightness.dark
//                 ? Get.theme.colorScheme.surfaceVariant
//                 : Get.theme.colorScheme.surface,
//             child: SizedBox(
//               width: context.screenWidth * 95,
//               height: context.screenHeight * 70,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Spacer(
//                     flex: 1,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Spacer(
//                         flex: 1,
//                       ),
//                       SizedBox(
//                         width: context.screenWidth * 35,
//                         height: context.screenHeight * 27,
//                         child: VideoScreen(
//                           videoPath: student.video!,
//                         ),
//                       ),
//                       const Spacer(flex: 1),
//                       student.firstImage == ''
//                           ? IconButton(
//                               icon: const Icon(Icons.add),
//                               onPressed: () {
//                                 // cnr.addFirstImage(student.id);
//                               },
//                             )
//                           : Image.file(
//                               File(student.firstImage),
//                             ),
//                       const Spacer(flex: 3),
//                       GestureDetector(
//                         onTap: () async {
//                           await cnr.addFirstImage(
//                               student.id,
//                               student.place,
//                               student.firstImage,
//                               student.secondImage,
//                               student.video,
//                               student.latitude,
//                               student.latitude);
//                         },
//                         child: Container(
//                           height: context.screenHeight * 5,
//                           width: context.screenWidth * 20,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 39, 124, 27),
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                           ),
//                           child: Center(
//                             child: MyText(
//                               fieldName: 'تعديل',
//                               fontSize: context.screenSize * sixFont,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Spacer(flex: 3),
//                     ],
//                   ),
//                   const Spacer(
//                     flex: 3,
//                   ),
//                   SizedBox(
//                     width: context.screenWidth * 40,
//                     height: context.screenHeight * 30,
//                     child: Column(
//                       children: [
//                         const Spacer(),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               student.place!,
//                               style: Get.textTheme.titleLarge,
//                             ),
//                             Text(
//                               student.firstImage!,
//                               style: Get.textTheme.titleLarge,
//                             ),
//                             Text(
//                               student.secondImage!,
//                               style: Get.textTheme.titleLarge,
//                             ),
//                             Text(
//                               student.longitude.toString(),
//                               style: Get.textTheme.titleLarge,
//                             ),
//                             Text(
//                               student.latitude.toString(),
//                               style: Get.textTheme.titleLarge,
//                             ),
//                           ],
//                         ),
//                         const Spacer(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () async {
//                                 onDelete(student);
//                               },
//                               child: Container(
//                                 height: context.screenHeight * 5,
//                                 width: context.screenWidth * 20,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 162, 29, 29),
//                                   border: Border.all(),
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(15),
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: MyText(
//                                     fieldName: "مسح",
//                                     fontSize: context.screenSize * sixFont,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () async {
//                                 // await _shareVideo(student.firstImage);
//                               },
//                               child: Container(
//                                 height: context.screenHeight * 5,
//                                 width: context.screenWidth * 20,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 39, 124, 27),
//                                   border: Border.all(color: Colors.grey),
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(15),
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: MyText(
//                                     fieldName: 'مشاركة',
//                                     fontSize: context.screenSize * sixFont,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Spacer(),
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   buildVideoPlayer(VideoPlayerController controller) {
//     return Column(
//       children: [
//         Center(
//           child: controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: controller.value.aspectRatio,
//                   child: VideoPlayer(controller),
//                 )
//               : Container(),
//         ),
//       ],
//     );
//   }
// }

// class OrderController extends GetxController {
//   Future<void> edit(
//       id, place, firstImage, secondImage, video, latitude, longitude) async {
//     try {
//       Student updatedStudent = Student(
//         id: id, // تحديد معرف السجل المراد تحديثه
//         place: place, firstImage: firstImage, secondImage: secondImage,
//         video: video, latitude: latitude, longitude: longitude,
//       );
//       await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
//       update();
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> addFirstImage(
//       id, place, firstImage, secondImage, video, latitude, longitude) async {
//     // final pickedFile =
//     //     await ImagePicker().pickVideo(source: ImageSource.camera);
//     // if (pickedFile != null) {
//     //   final videoFile = File(pickedFile.path);
//     // }
//     try {
//       Student updatedStudent = Student(
//         id: id, // تحديد معرف السجل المراد تحديثه
//         place: place, firstImage: firstImage, secondImage: secondImage,
//         video: video, latitude: latitude, longitude: longitude,
//       );
//       await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
//       update();
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// class OrderDatabaseTwo {
//   static final OrderDatabaseTwo _orderDatabase = OrderDatabaseTwo._internal();
//   static OrderDatabaseTwo get instance => _orderDatabase;
//   static Database? db;

//   static const String table = 'orders';

//   // Get database instance
//   Future<Database> get database async {
//     if (db != null) {
//       return db!;
//     }

//     db = await _init();
//     return db!;
//   }

//   // Initialize database
//   Future<Database> _init() async {
//     return await openDatabase(join(await getDatabasesPath(), 'mavyorder.db'),
//         onCreate: (db, version) async {
//       // First time the database is created
//       await db.execute(
//           "CREATE TABLE $table (id INTEGER PRIMARY KEY, place TEXT, video TEXT,  firstImage TEXT,secondImage TEXT, latitude REAL, longitude REAL)");
//     }, version: 1);
//   }

//   // Get students
//   Future<List<Student>> getStudents(String name) async {
//     final List<Map<String, Object?>> result = await (await database).query(
//       table,
//       where: "place LIKE ?",
//       whereArgs: ["%$name%"],
//       orderBy: "id DESC",
//     );
//     return result.map((e) => Student.fromMap(e)).toList();
//   }

//   // Add student
//   Future<int> addOrder(Student student) async {
//     return await (await database).insert(table, student.toMap());
//   }

//   // Delete student
//   Future<bool> deleteOrder(Student student) async {
//     return await (await database)
//             .delete(table, where: "id = ?", whereArgs: [student.id]) >
//         0;
//   }

// // Update order
//   Future<int> updateOrder(Student updatedStudent) async {
//     final db = await database;
//     return await db.update(
//       table,
//       updatedStudent.toMap(),
//       where: 'id = ?',
//       whereArgs: [updatedStudent.id],
//     );
//   }

//   OrderDatabaseTwo._internal();
// }

// class Student {
//   int? id;
//   String place;
//   String video;
//   String firstImage;
//   String secondImage; // New field
//   double latitude;
//   double longitude;
//   Student({
//     this.id,
//     required this.video,
//     required this.place,
//     required this.firstImage,
//     required this.secondImage, // New field
//     required this.latitude,
//     required this.longitude,
//   });

//   // Convert Student object to a Map object
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'place': place,
//       'video': video,
//       'firstImage': firstImage,
//       'secondImage': secondImage,
//       'latitude': latitude,
//       'longitude': longitude,
//     };
//   }

//   // Convert a Map object to a Student object
//   factory Student.fromMap(Map<String, dynamic> map) {
//     return Student(
//       id: map['id'],
//       place: map['place'],
//       video: map['video'],
//       firstImage: map['firstImage'],
//       secondImage: map['secondImage'],
//       latitude: map['latitude'],
//       longitude: map['longitude'],
//     );
//   }
// }

// /// Show an overlay with a message
// void showOverlay(String message) {
//   Get.dialog(
//     WillPopScope(
//       onWillPop: () async => false,
//       child: AlertDialog(
//         contentPadding: const EdgeInsets.all(32),
//         content: Row(
//           children: [
//             const CircularProgressIndicator(),
//             const SizedBox(width: 16),
//             Text(message)
//           ],
//         ),
//       ),
//     ),
//   );
// }

// // Enum for the type of error
// enum DialogType {
//   error,
//   success,
// }

// /// Show a dialog with a message
// void showCustomDialog(String title, String message, List<Widget> actions,
//     {DialogType type = DialogType.success}) {
//   Get.dialog(
//     barrierDismissible: false,
//     WillPopScope(
//       onWillPop: () async => false,
//       child: AlertDialog(
//         backgroundColor: type == DialogType.error
//             ? Get.theme.colorScheme.errorContainer
//             : Get.theme.dialogBackgroundColor,
//         title: Text(title),
//         content: Text(message),
//         actions: actions,
//       ),
//     ),
//   );
// }

// /// Compress an image and copy it to a new location
// Future<Object> compressImageAndCopy(File image, String destination) async {
//   // Compress image
//   XFile? result = await FlutterImageCompress.compressAndGetFile(
//     image.absolute.path,
//     destination,
//     quality: 20,
//   );
//   // If compression failed, return original image and show error
//   if (result == null) {
//     showCustomDialog(
//       "Error",
//       "An error occured while compressing the image, using the original image instead.",
//       [
//         TextButton(
//           style: TextButton.styleFrom(
//               foregroundColor: Get.theme.colorScheme.onErrorContainer),
//           onPressed: () {
//             Get.back();
//           },
//           child: const Text("Ok"),
//         ),
//       ],
//     );

//     return image;
//   }
//   // Return compressed image
//   return result;
// }

// class StudentListControllerTwo extends GetxController {
//   final RxList<Student> _students = <Student>[].obs;

//   int get count => _students.length;

//   List<Student> getStudents() {
//     return _students;
//   }

//   Student at(int index) {
//     return _students[index];
//   }

//   void setStudents(List<Student> students) {
//     _students.assignAll(students);
//     update();
//   }

//   void addStudent(Student student) {
//     _students.insert(0, student);
//     update();
//   }

//   void deleteStudent(Student student) {
//     _students.remove(student);
//     update();
//   }
// }

// late VideoPlayerController? fileController;

// class Values {
//   static Directory? appDirectory;
// }

// class VideoScreen extends StatefulWidget {
//   final String videoPath;

//   const VideoScreen({Key? key, required this.videoPath}) : super(key: key);

//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then(
//         (_) {
//           setState(() {});
//         },
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : const CircularProgressIndicator(),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(
//       //       () {
//       //         if (_controller.value.isPlaying) {
//       //           _controller.pause();
//       //         } else {
//       //           _controller.play();
//       //         }
//       //       },
//       //     );
//       //   },
//       //   child: Icon(
//       //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//       //   ),
//       // ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose(); // يتم التخلص من المشغل عند تدمير الواجهة
//   }
// }
