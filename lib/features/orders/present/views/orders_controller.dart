// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../../mbean_temporary/controllers/student_list.dart';
// import '../../../../mbean_temporary/core/order.dart';
// import '../../../../mbean_temporary/db/orders.dart';
// import 'package:location/location.dart' as loc;
// import 'package:share_plus/share_plus.dart';
// import 'package:file_picker/file_picker.dart';
// import 'home_view.dart';

// class HomeController extends GetxController {
//   final TextEditingController palaceController = TextEditingController();
//   final loc.Location location = loc.Location();
//   // late VideoPlayerController? fileController;

//   double latitude = 0;
//   double longitude = 0;
//   late File? videoFile;
//   late File? firstImageFile;
//   late File? secondImageFile;

//   final RxString imagePath = "".obs;
//   void defaultDialog() {
//     Get.defaultDialog(
//       title: "المكان",
//       content: SizedBox(
//         width: 300,
//         height: 125,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: TextField(
//                 controller: palaceController,
//                 style: const TextStyle(fontSize: 20, color: Colors.black),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                     width: 80,
//                     height: 40,
//                     color: Colors.green,
//                     child: const Center(
//                       child: Text(
//                         'الغاء',
//                         style: TextStyle(color: Colors.white, fontSize: 25),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     palaceController.text == ''
//                         ? addPalaceSnackBar('ادخل المكان')
//                         : {
//                             Get.back(),
//                             recordVideo(),
//                           };
//                   },
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     color: Colors.green,
//                     child: const Center(
//                       child: Text(
//                         'تأكيد',
//                         style: TextStyle(color: Colors.white, fontSize: 25),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> recordVideo() async {
//     final pickedFile =
//         await ImagePicker().pickVideo(source: ImageSource.camera);
//     if (pickedFile != null) {
//       videoFile = File(pickedFile.path);
//       update();
//     }
//     await getCurrentLocation();
//     addorder(palaceController.text, pickedFile!.path, latitude, longitude);
//   }

//   Future<void> addorder(
//       String place, String video, double latitude, double longitude) async {
//     try {
//       place = place.trim();
//       Order order = Order(
//         place: palaceController.text,
//         video: video,
//         firstImage: '',
//         secondImage: '',
//         latitude: latitude,
//         longitude: longitude,
//       );
//       order.id = await OrderDatabase.instance.addOrder(order);
//       order.latitude = latitude;
//       order.longitude = longitude;
//       Get.find<StudentListController>().addStudent(order);
//       Get.back();
//       update();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   Future<void> shareOrderLocation(
//     String place,
//     String videoPath,
//     String firstImagePath,
//     String secondImagePath,
//     double latitude,
//     double longitude,
//   ) async {
//     var videoFile = File(videoPath);
//     var firstImageFile = File(firstImagePath);
//     var secondImageFile = File(secondImagePath);
//     String placeAddress = 'المكان : ${place.toString()}';
//     String location =
//         "Check location:\nhttps://maps.google.com/?q=$latitude,$longitude";
//     if (videoFile.existsSync() &&
//         firstImageFile.existsSync() &&
//         secondImageFile.existsSync()) {
//       // await Share.shareFiles([videoPath, firstImagePath, secondImagePath],
//       //     text: 'المكان:$place'
//       //         '\n'
//       //         '$location');
//     } else {
//       print('One or more files do not exist!');
//     }
//   }

//   Future<void> shareVideo(
//     String place,
//     String videoPath,
//     String firstImagePath,
//     String secondImagePath,
//     double latitude,
//     double longitude,
//   ) async {
//     String message =
//         "Check out my location:\nhttps://maps.google.com/?q=$latitude,$longitude";
//     var videoFile = File(videoPath);
//     var firstImageFile = File(firstImagePath);
//     var secondImageFile = File(secondImagePath);
//     String placeAddress = 'المكان : ${place.toString()}';
//     if (videoFile.existsSync() &&
//         firstImageFile.existsSync() &&
//         secondImageFile.existsSync()) {
//       // await Share.shareFiles(
//       //   [videoPath, firstImagePath, secondImagePath],
//       // );
//     } else {
//       print('One or more files do not exist!');
//     }
//   }

//   // setVedioFile(String path) async {
//   //   final file = File(path);
//   //   fileController = VideoPlayerController.file(file)
//   //     ..initialize().then(
//   //       (_) {
//   //         fileController?.play();
//   //       },
//   //     );
//   // }

//   Future<File?> pickFile() async {
//     final result = await FilePicker.platform.pickFiles(type: FileType.video);
//     if (result == null) return null;
//     return File(result.files.single.path.toString());
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

//   Future<void> getCurrentLocation() async {
//     try {
//       final loc.LocationData locationResult = await location.getLocation();
//       latitude = locationResult.latitude!;
//       longitude = locationResult.longitude!;
//       update();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   sendLocationOnWhatsApp() async {
//     // Get current location
//     double latitude = 37.422;
//     double longitude = -122.084;
//     // Prepare WhatsApp message
//     String message =
//         "Check out my location:\nhttps://maps.google.com/?q=$latitude,$longitude";
//     // Encode message
//     String url = "https://wa.me/?text=${Uri.encodeFull(message)}";

//     // Launch WhatsApp
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   Future<void> pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       firstImageFile = File(pickedFile.path);
//       update();
//     }
//   }

//   Future<void> replaceViedo(
//       int? id,
//       String place,
//       String firstImage,
//       String secondImage,
//       String video,
//       double latitude,
//       double longitude) async {
//     try {
//       await pickNewVideo();
//       // Student updatedStudent = Student(
//       //   id: id,
//       //   place: place,
//       //   firstImage: firstImage,
//       //   secondImage: secondImage,
//       //   video: videoFile!.path,
//       //   latitude: latitude,
//       //   longitude: longitude,
//       // );
//       // await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
//       update();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   Future<void> pickNewVideo() async {
//     final pickedFile =
//         await ImagePicker().pickVideo(source: ImageSource.camera);
//     if (pickedFile != null) {
//       videoFile = File(pickedFile.path);
//       update();
//     }
//   }

//   Future<void> addFirstImage(
//       int? id,
//       String place,
//       String firstImage,
//       String secondImage,
//       String video,
//       double latitude,
//       double longitude) async {
//     try {
//       // await pickImage();
//       // Student updatedStudent = Student(
//       //   id: id,
//       //   place: place,
//       //   firstImage: firstImageFile!.path,
//       //   secondImage: secondImage,
//       //   video: video,
//       //   latitude: latitude,
//       //   longitude: longitude,
//       // );
//       // await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
//       // update();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   Future<void> addSecondImage(
//       int? id,
//       String place,
//       String firstImage,
//       String secondImage,
//       String video,
//       double latitude,
//       double longitude) async {
//     try {
//       // await pickImage();
//       // Student updatedStudent = Student(
//       //   id: id,
//       //   place: place,
//       //   firstImage: firstImage,
//       //   secondImage: firstImageFile!.path,
//       //   video: video,
//       //   latitude: latitude,
//       //   longitude: longitude,
//       // );
//       // await OrderDatabaseTwo.instance.updateOrder(updatedStudent);
//       // update();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   void clearInputs() {}

//   void clearImageCache() {
//     // if (imagePath.isEmpty) return;
//     // File(imagePath.value).parent.delete(recursive: true);
//     // imagePath.value = "";
//     palaceController.clear();
//     // firstImageFile = null;
//   }

//   void showDeleteConfirmation(Order student) {
//     // showCustomDialog(
//     //   "",
//     //   "              هل انت متأكد من مسح الفيديو ؟",
//     //   [
//     //     TextButton(
//     //         onPressed: () {
//     //           Get.back();
//     //         },
//     //         child: const MyText(
//     //             fieldName: 'الغاء', fontSize: 20, color: Colors.black)),
//     //     TextButton(
//     //       onPressed: () async {
//     //         // Close dialog
//     //         Get.back();

//     //         // Check if student has an id
//     //         if (student.id == null) {
//     //           showDeleteError();
//     //           return;
//     //         }
//     //         // Delete student from database
//     //         await OrderDatabase.instance.deleteOrder(student);
//     //         // Delete student from list
//     //         Get.find<StudentListController>().deleteStudent(student);
//     //         // Delete student image
//     //         await File("${Values.appDirectory!.path}/${student.video}")
//     //             .delete();
//     //       },
//     //       child:
//     //           const MyText(fieldName: 'مسح', fontSize: 20, color: Colors.black),
//     //     ),
//     //   ],
//     // );
//   }

//   void showDeleteError() {
//     //   showCustomDialog(
//     //     "خطأ",
//     //     'حدث خطأ اثناء مسح الفيديو',
//     //     [
//     //       TextButton(
//     //         style: TextButton.styleFrom(
//     //             foregroundColor: Get.theme.colorScheme.onErrorContainer),
//     //         onPressed: () {
//     //           Get.back();
//     //         },
//     //         child:
//     //             const MyText(fieldName: 'اوك', fontSize: 20, color: Colors.black),
//     //       ),
//     //     ],
//     //   );
//   }
// }

// class MyText extends StatelessWidget {
//   const MyText({
//     super.key,
//     required this.fieldName,
//     required this.fontSize,
//     required this.color,
//   });

//   final double fontSize;
//   final String fieldName;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       fieldName,
//       style: TextStyle(
//           fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
//     );
//   }
// }
