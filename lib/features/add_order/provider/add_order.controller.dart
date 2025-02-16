import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/all_imports.dart';
import 'package:http/http.dart' as http;

class AddOrderController {
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController orderIDController = TextEditingController();
  final TextEditingController clientIdController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController videoController = TextEditingController();
  final TextEditingController firstImageController = TextEditingController();
  final TextEditingController secondImageController = TextEditingController();

//   void selectFilesPath({
//     required AppLocalizations t
// ,
//     required BuildContext context,required int file,
//   }) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text(t.select_files,
//           ),
//           actions: [
//             IconsOutlineButton(
//               onPressed: () async {
//                 switch (file) {
//                   case 0:
//                     await pickVideo();
//                     break;
//                   case 1:
//                   case 2:
//                     await pickImageCamera(file);
//                     break;
//                 }
//                 Navigator.of(context).pop();
//               },
//               text: t.camera,
//               iconData: CupertinoIcons.camera_fill,
//               textStyle: const TextStyle(color: Colors.white),
//               color: AppColors.greenColor,
//               iconColor: Colors.white,
//             ),
//             IconsOutlineButton(
//               onPressed: () async {
//                 switch (file) {
//                   case 0:
//                     await pickVideoGallery();
//                     break;
//                   case 1:
//                   case 2:
//                     await pickImageGallery(imageNumber:file,
//                     );
//                     break;
//                 }
//                 Navigator.of(context).pop();
//               },
//               text: t.gallery,
//               iconData: CupertinoIcons.photo_on_rectangle,
//               color: AppColors.greenColor,
//               textStyle: const TextStyle(color: Colors.white),
//               iconColor: Colors.white,
//             ),
//           ],
//         );
//       },
//     );
//   }

  // Future<void> pickVideo() async {
  //   XFile? videoFile = await imagePicker.pickVideo(
  //     source: ImageSource.camera,
  //   );
  //   if (videoFile != null) {
  //     videoFile = videoFile;
  //     videoController.text = pickedVideo!.name;
  //   }
  // }
  // Future<void> pickVideoGallery() async {
  //   XFile? videoFile = await imagePicker.pickVideo(
  //     source: ImageSource.gallery,
  //   );
  //   if (videoFile != null) {
  //     pickedVideo = videoFile;
  //     videoController.text = pickedVideo!.name;
  //   }
  // }

  // Future<void> pickImageCamera(int imageNumber) async {
  //   XFile? imageFile = await imagePicker.pickImage(
  //     source: ImageSource.camera,
  //   );
  //   if (imageFile != null) {
  //     switch (imageNumber) {
  //       case 1:
  //         pickedFirstImage = imageFile;
  //         firstImageController.text = pickedFirstImage!.name;
  //         break;
  //       case 2:
  //         pickedSecondImage = imageFile;
  //         secondImageController.text = pickedSecondImage!.name;
  //         break;
  //     }
  //   }
  // }

  // Future<void> pickImageGallery({required int imageNumber,
  // }) async {
  //   XFile? imageFile = await imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (imageFile != null) {
  //     switch (imageNumber) {
  //       case 1:
  //         pickedFirstImage = imageFile;
  //         firstImageController.text = pickedFirstImage!.name;
  //         break;
  //       case 2:
  //         pickedSecondImage = imageFile;
  //         secondImageController.text = pickedSecondImage!.name;
  //         break;
  //     }
  //   }
  // }

  // Future<Map<String, dynamic>> addOrder(
  //   String clientId,
  //   String place,
  //   XFile video,
  //   XFile imageOne,
  //   XFile imageTwo,
  // ) async {
  //   Map<String, double>? location = await getCurrentLocation();
  //   var latitude = location!['latitude'] ?? 0.0;
  //   var longitude = location['longitude'] ?? 0.0;

  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse(
  //       'https://mubin.aquan.website/api/orders',
  //     ),
  //   );

  //   // request.headers.addAll(await LoginController.getAuthHeaders());
  //   request.fields.addAll(
  //     {
  //       'client_id': clientId,
  //       'latitude': latitude.toString(),
  //       'longitude': longitude.toString(),
  //       'place': place,
  //     },
  //   );
  //   var pickedVideo = await http.MultipartFile.fromPath("video", video.path,
  //   );
  //   var pickedImageOne =
  //       await http.MultipartFile.fromPath("image_one", imageOne.path,
  //       );
  //   var pickedImageTwo =
  //       await http.MultipartFile.fromPath("image_two", imageTwo.path,
  //       );
  //   request.files.add(pickedVideo);
  //   request.files.add(pickedImageOne);
  //   request.files.add(pickedImageTwo);
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   final data = json.decode(response.body) as Map<String, dynamic>;
  //   if (response.statusCode == 200) {
  //     return data;
  //   } else {
  //     return data;
  //   }
  // }
}
