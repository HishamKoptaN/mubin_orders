import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as loc;
import '../../../global/colors.dart';
import '../../../global/custom_snackbar.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:video_compress_plus/video_compress_plus.dart';

class AdminProductsController extends GetxController {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker imagePicker = ImagePicker();
  final loc.Location location = loc.Location();
  String targetCollection = '';

  GeoPoint orderLocationGeoPoint = const GeoPoint(0, 0);
  TextEditingController orderIDController = TextEditingController();
  TextEditingController placeNameController = TextEditingController();
  TextEditingController videoController = TextEditingController();
  TextEditingController firstImageController = TextEditingController();
  TextEditingController secondImageController = TextEditingController();
  XFile? pickedVideo;
  XFile? pickedFirstImage;
  XFile? pickedSecondImage;
  String videoUrl = '';
  String firstImageUrl = '';
  String secondImageUrl = '';
  bool isLoadIng = false;
  @override
  void onInit() {
    super.onInit();
  }

  void showLoading() {
    isLoadIng = true;
    update();
  }

  void hideLoading() {
    isLoadIng = false;
    update();
  }

  Future<void> getCurrentLocation() async {
    try {
      final loc.LocationData locationResult = await location.getLocation();
      orderLocationGeoPoint = GeoPoint(
        locationResult.latitude!,
        locationResult.longitude!,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getCurrentUser() async {
    if (targetCollection == '') {
      final currentUser = FirebaseAuth.instance.currentUser?.email;
      targetCollection = currentUser!;
    }
  }

  Future<bool> isDocumentExists(
      String collectionPath, String documentId) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await _firestore.collection(collectionPath).doc(documentId).get();
      return documentSnapshot.exists;
    } catch (e) {
      print('Error checking document existence: $e');
      return false;
    }
  }

  //         Pick Vido          //
  void selectVideoPath() {
    Dialogs.materialDialog(
      context: Get.context!,
      title: 'اختر مسار الملفات',
      msg: 'حدد من اين تفضل اضافة الملفات ',
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      msgStyle: const TextStyle(
        fontSize: 17,
      ),
      actions: [
        IconsOutlineButton(
          onPressed: () async {
            await pickVideoCamera();
            Navigator.pop(Get.context!);
          },
          text: 'الكاميرا',
          iconData: CupertinoIcons.camera_fill,
          textStyle: const TextStyle(color: Colors.white),
          color: AppColors.greenColor,
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () async {
            await pickVideoGallery();
            Navigator.pop(Get.context!);
          },
          text: 'الاستديو',
          iconData: CupertinoIcons.photo_on_rectangle,
          color: AppColors.greenColor,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  Future<void> pickVideoCamera() async {
    XFile? imageFile = await imagePicker.pickVideo(
      source: ImageSource.camera,
      maxDuration: Duration(seconds: 30),
    );
    if (imageFile != null) {
      pickedVideo = imageFile;
      videoController.text = pickedVideo!.name;
    }
  }

  Future<void> pickVideoGallery() async {
    XFile? videoFile = await imagePicker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: Duration(seconds: 30),
    );
    if (videoFile != null) {
      pickedVideo = videoFile;
      videoController.text = pickedVideo!.name;
    }
  }

  //                          //
  void selectFirstImagePath() {
    Dialogs.materialDialog(
      context: Get.context!,
      title: 'اختر مسار الملفات',
      msg: 'حدد من اين تفضل اضافة الملفات ',
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      msgStyle: const TextStyle(
        fontSize: 17,
      ),
      actions: [
        IconsOutlineButton(
          onPressed: () async {
            await pickFirstImageCamera();
            Navigator.pop(Get.context!);
          },
          text: 'الكاميرا',
          iconData: CupertinoIcons.camera_fill,
          textStyle: const TextStyle(color: Colors.white),
          color: AppColors.greenColor,
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () async {
            await pickFirstImageGallery();
            Navigator.pop(Get.context!);
          },
          text: 'الاستديو',
          iconData: CupertinoIcons.photo_on_rectangle,
          color: AppColors.greenColor,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  Future<void> pickFirstImageCamera() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (imageFile != null) {
      pickedFirstImage = imageFile;
      firstImageController.text = pickedFirstImage!.name;
    }
  }

  Future<void> pickFirstImageGallery() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (imageFile != null) {
      pickedFirstImage = imageFile;
      firstImageController.text = pickedFirstImage!.name;
    }
  }

//                                   //
  void selectSecondImagePath() {
    Dialogs.materialDialog(
      context: Get.context!,
      title: 'اختر مسار الملفات',
      msg: 'حدد من اين تفضل اضافة الملفات ',
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      msgStyle: const TextStyle(
        fontSize: 17,
      ),
      actions: [
        IconsOutlineButton(
          onPressed: () async {
            await pickSecondImageCamera();
            Navigator.pop(Get.context!);
          },
          text: 'الكاميرا',
          iconData: CupertinoIcons.camera_fill,
          textStyle: const TextStyle(color: Colors.white),
          color: AppColors.greenColor,
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () async {
            await pickSecondImageGallery();
            Navigator.pop(Get.context!);
          },
          text: 'الاستديو',
          iconData: CupertinoIcons.photo_on_rectangle,
          color: AppColors.greenColor,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  Future<void> pickSecondImageCamera() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (imageFile != null) {
      pickedSecondImage = imageFile;
      secondImageController.text = pickedFirstImage!.name;
    }
  }

  Future<void> pickSecondImageGallery() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (imageFile != null) {
      pickedSecondImage = imageFile;
      secondImageController.text = pickedFirstImage!.name;
    }
  }

  Future<void> addProduct() async {
    await getCurrentUser();
    await getCurrentLocation();

    if (await isDocumentExists(targetCollection, orderIDController.text)) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'خطأ',
        message: 'معرف الطلب موجود , ادخل معرف اخر',
      );
    } else if (await isDocumentExists(
            targetCollection, orderIDController.text) ==
        false) {
      showLoading();
      if (checkData()) {
        try {
          // ضغط الفيديو قبل الرفع
          File? compressedVideo = await compressVideoFile(pickedVideo!.path);
          videoUrl = await videoUpload(path: compressedVideo!.path);
          // رفع الصور الأولى والثانية كالمعتاد
          firstImageUrl = await firstImageUpload(path: pickedFirstImage!.path);
          secondImageUrl =
              await secondImageUpload(path: pickedSecondImage!.path);
          // الحصول على الموقع الجغرافي
          // رفع البيانات إلى Firebase Firestore
          await FirebaseFirestore.instance
              .collection(targetCollection)
              .doc(orderIDController.text)
              .set(
            {
              'order_id': orderIDController.text,
              'place_name': placeNameController.text,
              'order_location': orderLocationGeoPoint,
              'order_video': videoUrl,
              'order_first_image': firstImageUrl,
              'order_second_image': secondImageUrl,
              'order_Location': orderLocationGeoPoint,
            },
          );

          clearTextFields();
          CustomSnackBar.showCustomSnackBar(
            title: 'تمت الاضافة',
            message: 'تم اضافة الطلب بنجاح ',
          );
          hideLoading();
        } catch (e) {
          CustomSnackBar.showCustomSnackBar(
            title: 'حدث خطأ',
            message: '$eلم يتم رفع البيانات يرجى اعادة المحاولة',
          );
          hideLoading();
        }
      }
      hideLoading();
    }
  }

  compressVideoFile(String videoPath) async {
    final compressedVideoFile = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.Res640x480Quality,
    );
    return compressedVideoFile?.file;
  }
  // Future<void> addProduct() async {
  //   await getCurrentUser();

  //   if (await isDocumentExists(targetCollection, orderIDController.text)) {
  //     CustomSnackBar.showCustomErrorSnackBar(
  //       title: 'خطأ',
  //       message: 'معرف الطلب موجود , ادخل معرف اخر',
  //     );
  //   } else if (await isDocumentExists(
  //           targetCollection, orderIDController.text) ==
  //       false) {
  //     showLoading();
  //     if (checkData()) {
  //       try {
  //         videoUrl = await videoUpload(path: pickedVideo!.path);
  //         firstImageUrl = await firstImageUpload(path: pickedFirstImage!.path);
  //         secondImageUrl =
  //             await secondImageUpload(path: pickedSecondImage!.path);
  //         await getCurrentLocation();
  //         await FirebaseFirestore.instance
  //             .collection(targetCollection)
  //             .doc(orderIDController.text)
  //             .set(
  //           {
  //             'order_id': orderIDController.text,
  //             'place_name': placeNameController.text,
  //             'order_location': orderLocationGeoPoint,
  //             'order_video': videoUrl,
  //             'order_first_image': firstImageUrl,
  //             'order_second_image': secondImageUrl,
  //             'order_Location': orderLocationGeoPoint,
  //           },
  //         );

  //         clearTextFields();
  //         CustomSnackBar.showCustomSnackBar(
  //           title: 'تمت الاضافة',
  //           message: 'تم اضافة الطلب بنجاح ',
  //         );
  //         hideLoading();
  //       } catch (e) {
  //         CustomSnackBar.showCustomSnackBar(
  //           title: 'حدث خطأ',
  //           message: '$eلم يتم رفع البيانات يرجى اعادة المحاولة',
  //         );
  //         hideLoading();
  //       }
  //     }
  //     hideLoading();
  //   }
  // }

  void clearTextFields() {
    orderIDController.text = '';
    placeNameController.text = '';
    videoController.text = '';
    secondImageController.text = '';
    firstImageController.text = '';
  }

  bool checkData() {
    if (orderIDController.text.isNotEmpty &&
        placeNameController.text.isNotEmpty &&
        pickedVideo != null &&
        pickedFirstImage != null &&
        pickedSecondImage != null) {
      return true;
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
        title: "لا يمكن تركه فارغاً",
        message: 'الرجاء ادخال البيانات المطلوبة',
      );
      return false;
    }
  }

  Future<String> videoUpload({required String path}) async {
    UploadTask uploadTask = firebaseStorage
        .ref('$targetCollection/${orderIDController.text}/video.mp4')
        .putFile(File(path));
    await uploadTask;
    return await uploadTask.snapshot.ref.getDownloadURL();
  }

  Future<String> firstImageUpload({required String path}) async {
    UploadTask uploadTask = firebaseStorage
        .ref('$targetCollection/${orderIDController.text}/first_image.jpg')
        .putFile(File(path));
    await uploadTask;
    return await uploadTask.snapshot.ref.getDownloadURL();
  }

  Future<String> secondImageUpload({required String path}) async {
    UploadTask uploadTask = firebaseStorage
        .ref('$targetCollection/${orderIDController.text}/second_image.jpg')
        .putFile(File(path));

    await uploadTask;
    return await uploadTask.snapshot.ref.getDownloadURL();
  }
}
