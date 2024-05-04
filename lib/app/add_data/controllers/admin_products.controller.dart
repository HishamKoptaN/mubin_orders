import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as loc;
import '../../../global/custom_snackbar.dart';

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
  String kiniaCollection = 'kinia_orders';
  String tenzaniaCollection = 'tanzania_orders';
  String bakstanCollection = 'oghanda_orders';
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
      switch (currentUser) {
        case 'somal@email.com':
          targetCollection = 'somal_orders';
        case 'kinia@email.com':
          targetCollection = 'kinia_orders';
        case 'tanzania@email.com':
          targetCollection = 'tanzania_orders';
      }
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

  Future<void> addProduct() async {
    await getCurrentUser();

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
          videoUrl = await videoUpload(path: pickedVideo!.path);
          firstImageUrl = await firstImageUpload(path: pickedFirstImage!.path);
          secondImageUrl =
              await secondImageUpload(path: pickedSecondImage!.path);
          await getCurrentLocation();
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

  Future<void> pickVideoCamera() async {
    XFile? imageFile = await imagePicker.pickVideo(
      source: ImageSource.camera,
    );
    if (imageFile != null) {
      pickedVideo = imageFile;
      videoController.text = pickedVideo!.name;
    }
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
