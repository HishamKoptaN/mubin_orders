import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as loc;
import 'package:mbean_talabat/global/media_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../generated/l10n.dart';
import '../../../global/colors.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:video_compress_plus/video_compress_plus.dart';

import '../../../main.dart';
import '../../gloabal_widgets/gloabal_widgets.dart';
import '../../login/login_view.dart';

class AdminProductsProvider extends ChangeNotifier {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker imagePicker = ImagePicker();
  final loc.Location location = loc.Location();
  String targetCollection = '';
  GeoPoint orderLocationGeoPoint = const GeoPoint(0, 0);
  final TextEditingController _orderIDController = TextEditingController();
  final TextEditingController _placeNameController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _firstImageController = TextEditingController();
  final TextEditingController _secondImageController = TextEditingController();
  get orderIDController => _orderIDController;
  get placeNameController => _placeNameController;
  get videoController => _videoController;
  get firstImageController => _firstImageController;
  get secondImageController => _secondImageController;
  XFile? pickedVideo;
  XFile? pickedFirstImage;
  XFile? pickedSecondImage;
  String videoUrl = '';
  String firstImageUrl = '';
  String secondImageUrl = '';
  bool _isLoading = false;
  get isLoading => _isLoading;

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
      return false;
    }
  }

  void selectFilesPath(BuildContext context, int file) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(S.of(context).select_files),
          actions: [
            IconsOutlineButton(
              onPressed: () async {
                if (file == 0) {
                  await pickVideo();
                } else if (file == 1) {
                  await pickImageCamera(file);
                } else if (file == 2) {
                  await pickImageCamera(file);
                }
                Navigator.of(context).pop();
              },
              text: S.of(context).camera,
              iconData: CupertinoIcons.camera_fill,
              textStyle: const TextStyle(color: Colors.white),
              color: AppColors.greenColor,
              iconColor: Colors.white,
            ),
            IconsButton(
              onPressed: () async {
                if (file == 0) {
                  await pickVideoGallery();
                } else if (file == 1) {
                  await pickImageGallery(file);
                } else if (file == 2) {
                  await pickImageGallery(file);
                }
                Navigator.of(context).pop();
              },
              text: S.of(context).gallery,
              iconData: CupertinoIcons.photo_on_rectangle,
              color: AppColors.greenColor,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ],
        );
      },
    );
  }

  Future<void> pickVideo() async {
    XFile? imageFile = await imagePicker.pickVideo(
      source: ImageSource.camera,
    );
    if (imageFile != null) {
      pickedVideo = imageFile;
      _videoController.text = pickedVideo!.name;
    }
  }

  Future<void> pickVideoGallery() async {
    XFile? videoFile = await imagePicker.pickVideo(
      source: ImageSource.gallery,
    );
    if (videoFile != null) {
      pickedVideo = videoFile;
      _videoController.text = pickedVideo!.name;
    }
  }

  //                          //
  Future<void> pickImageCamera(int imageNumber) async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile != null) {
      if (imageNumber == 1) {
        pickedFirstImage = imageFile;
        _firstImageController.text = pickedFirstImage!.name;
      } else if (imageNumber == 2) {
        pickedSecondImage = imageFile;
        _secondImageController.text = pickedSecondImage!.name;
      }
    }
  }

  Future<void> pickImageGallery(int imageNumber) async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      if (imageNumber == 1) {
        pickedFirstImage = imageFile;
        _firstImageController.text = pickedFirstImage!.name;
      } else if (imageNumber == 2) {
        pickedSecondImage = imageFile;
        _secondImageController.text = pickedSecondImage!.name;
      }
    }
  }

//                                   //
  Future<void> addProduct(context) async {
    setLoading(true);
    await getCurrentUser();
    await getCurrentLocation();

    if (await isDocumentExists(targetCollection, _orderIDController.text)) {
      setLoading(false);
      showDialogStatus(
          context, S.of(context).failed, S.of(context).order_id_exists, false);
    } else if (await isDocumentExists(
            targetCollection, _orderIDController.text) ==
        false) {
      if (checkData(context)) {
        try {
          File? compressedVideo = await compressVideoFile(pickedVideo!.path);
          videoUrl = await videoUpload(path: compressedVideo!.path);
          firstImageUrl = await firstImageUpload(path: pickedFirstImage!.path);
          secondImageUrl =
              await secondImageUpload(path: pickedSecondImage!.path);
          await FirebaseFirestore.instance
              .collection(targetCollection)
              .doc(_orderIDController.text)
              .set(
            {
              'order_id': _orderIDController.text,
              'place_name': _placeNameController.text,
              'order_location': orderLocationGeoPoint,
              'order_video': videoUrl,
              'order_first_image': firstImageUrl,
              'order_second_image': secondImageUrl,
              'order_Location': orderLocationGeoPoint,
            },
          );
          setLoading(false);
          clearTextFields();
          showDialogStatus(context, S.of(context).successfully,
              S.of(context).data_saved, true);
        } catch (e) {
          setLoading(false);
          showDialogStatus(context, S.of(context).failed,
              S.of(context).data_dont_saved, false);
        } finally {
          setLoading(false);
        }
      }
      setLoading(false);
    }
  }

  compressVideoFile(String videoPath) async {
    final compressedVideoFile = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.Res640x480Quality,
    );
    return compressedVideoFile?.file;
  }

  void clearTextFields() {
    orderIDController.text = '';
    placeNameController.text = '';
    videoController.text = '';
    secondImageController.text = '';
    firstImageController.text = '';
  }

  bool checkData(context) {
    if (_orderIDController.text.isNotEmpty &&
        _placeNameController.text.isNotEmpty &&
        pickedVideo != null &&
        pickedFirstImage != null &&
        pickedSecondImage != null) {
      return true;
    } else {
      showDialogStatus(context, S.of(context).failed,
          S.of(context).please_enter_all_data, false);

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

  void showDialogStatus(
      BuildContext context, String title, String content, bool status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.green,
          // backgroundColor: Colors.red,
          title: Icon(
            !status ? Icons.check_circle : Icons.error_rounded,
            color: !status ? Colors.green : Colors.red,
            size: 30,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyText(
                fieldName: "$title , $content",
                fontSize: setFont(context, 12),
                color: Colors.black,
              ),
            ],
          ),

          actions: [
            TextButton(
              child: MyText(
                fieldName: S.of(context).ok,
                fontSize: setFont(context, 15),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
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
}
