import 'dart:io';
<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:mbean_admin/mbean_temporary/global/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../image_view/image_view.dart';
import '../login/login_view.dart';
import '../video_player/video_player.dart';

class HomeProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
=======
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../add_data/views/add_new_product.widget.dart';
import '../login/login_view.dart';
import '../video_player.dart';
import 'home_view.dart';

class HomeProvider extends ChangeNotifier {
  late String _title;
  int _currentIndex = 0;
  late List<Widget> _pages;

  String get title => _title;
  int get currentIndex => _currentIndex;
  List<Widget> get pages => _pages;
  Future<void> getCurrentUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .get();
    name = userSnapshot.data()?['name'];
  }

  NavigatorBottomBarCnr() {
    _title = 'Home';
    _pages = [
      HomeView(),
      const AddNewProduct(),
    ];
  }

  void setCurrentIndex(int index, BuildContext context) async {
    switch (index) {
      case 0:
        _title = S.of(context).home_title;
        break;
      case 1:
        _title = S.of(context).add_order;
        break;
    }
    _currentIndex = index;
    notifyListeners();
  }

  //                     /////////////////////
  double xAlign = 0;
  Color arabicColor = Colors.black54;
  Color englishColor = Colors.white;
  bool isArabic = false;

  /////////////////////////////////////////////////////

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _targetCollection = '';
  late CachedVideoPlayerPlusController videoController;
  late CachedVideoPlayerPlusController videoPlayerController;
  final currentUser = FirebaseAuth.instance.currentUser?.email;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  var name = '';

>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

<<<<<<< HEAD
  String videoUrl = '';
  int currentIndex = 0;
  String targetBranch = 'Kenya@email.com';
  String currentLocale = '';
  bool isAraby = false;
  RxBool iSvideoPlaying = false.obs;
  bool isShowPlayerVideo = false;

  Future<void> initailzeBracnch() async {
    targetBranch = 'Kenya@email.com';
    notifyListeners();
  }

  void showPlayerVideo() {
    isShowPlayerVideo = true;
    iSvideoPlaying.value = true;
  }

  getCurrentLang() {
    currentLocale = Intl.getCurrentLocale();
    if (currentLocale == 'ar') {
      isAraby = true;
    } else if (currentLocale == 'en') {
      isAraby = false;
    }
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  List branchArData = [
    {
      'branch_collection': 'kenya@email.com',
      'name': 'كينيا',
      'flag': 'KE',
    },
    {
      'branch_collection': 'tanzania@email.com',
      'name': 'تنزانيا',
      'flag': 'TZ',
    },
    {
      'branch_collection': 'malawi@email.com',
      'name': 'مالاوي',
      'flag': 'MW',
    },
    {
      'branch_collection': 'cameroun@email.com',
      'name': 'الكاميرون',
      'flag': 'CM',
    },
    {
      'branch_collection': 'benin@email.com',
      'name': 'بنين',
      'flag': 'BJ',
    },
    {
      'branch_collection': 'ghana@email.com',
      'name': 'Ghana',
      'flag': 'GA',
    },
    {
      'branch_collection': 'guinee@email.com',
      'name': 'غينيا',
      'flag': 'GN',
    },
    {
      'branch_collection': 'uganda@email.com',
      'name': 'أوغندا',
      'flag': 'UG',
    },
  ];
  List branchEnData = [
    {
      'branch_collection': 'Kenya@email.com',
      'name': 'Kenya',
      'flag': 'KE',
    },
    {
      'branch_collection': 'tanzania@email.com',
      'name': 'Tanzania',
      'flag': 'TZ',
    },
    {
      'branch_collection': 'malawi@email.com',
      'name': 'Malawi',
      'flag': 'MW',
    },
    {
      'branch_collection': 'cameroun@email.com',
      'name': 'Cameroun',
      'flag': 'CM',
    },
    {
      'branch_collection': 'benin@email.com',
      'name': 'Bénin',
      'flag': 'BJ',
    },
    {
      'branch_collection': 'ghana@email.com',
      'name': 'Ghana',
      'flag': 'GH',
    },
    {
      'branch_collection': 'guinee@email.com',
      'name': 'Guinée',
      'flag': 'GN',
    },
    {
      'branch_collection': 'uganda@email.com',
      'name': 'Uganda',
      'flag': 'UG',
    },
  ];
  Future<void> setCurrentIndex(int index) async {
    currentIndex = index;

    switch (index) {
      case 0:
        targetBranch = branchArData[0]['branch_collection'];
        notifyListeners();

      case 1:
        targetBranch = branchArData[1]['branch_collection'];
        notifyListeners();

      case 2:
        targetBranch = branchArData[2]['branch_collection'];
        notifyListeners();
      case 3:
        targetBranch = branchArData[3]['branch_collection'];
        notifyListeners();
      case 4:
        targetBranch = branchArData[4]['branch_collection'];
        notifyListeners();
      case 5:
        targetBranch = branchArData[5]['branch_collection'];
        notifyListeners();
      case 6:
        targetBranch = branchArData[6]['branch_collection'];
        notifyListeners();
      case 7:
        targetBranch = branchArData[7]['branch_collection'];
        notifyListeners();
    }
  }

  // Future<void> shareOrder(String collection,String orderId) async {
  //   showCustomSnackBar(
  //       title: 'مشاركة الطلب',
  //       message: 'جاري مشاركة الطلب',
  //       duration: const Duration(seconds: 2));
  //   Reference videoRef;
  //   Reference firstImageRef;
  //   Reference secondImageRef;
  //   try {
  //     final storageRef = FirebaseStorage.instance.ref();
  //     videoRef = storageRef.child("$collection/$orderId/video.mp4");
  //     firstImageRef = storageRef.child("$collection/$orderId/first_image.jpg");
  //     secondImageRef =
  //         storageRef.child("$collection/$orderId/second_image.jpg");
  //     final dir = await getApplicationDocumentsDirectory();
  //     final videoFile = File('${dir.path}/${videoRef.name}.mp4');
  //     final firstImagFile = File('${dir.path}/${firstImageRef.name}.jpg');
  //     final secondImageFile = File('${dir.path}/${secondImageRef.name}.jpg');
  //     await videoRef.writeToFile(videoFile);
  //     await firstImageRef.writeToFile(firstImagFile);
  //     await secondImageRef.writeToFile(secondImageFile);

  //     await Share.shareFiles(
  //       [
  //         videoFile.path,
  //         firstImagFile.path,
  //         secondImageFile.path,
  //       ],
  //     );
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error occurred while downloading file: $e');
  //     }
  //   }
  // }
  Future<void> shareLocationOnWhatsApp(
      String orderPlace, GeoPoint location) async {
    setLoading(true);
    try {
      double latitude = location.latitude;
      double longitude = location.longitude;
      String locationUrl = "https://maps.google.com/?q=$latitude,$longitude";
      String combinedMessage = "المكان :$orderPlace\n$locationUrl";
      await Share.share(
        combinedMessage,
      );
      setLoading(false);
    } catch (e) {
      setLoading(false);
    }
  }

  Future<void> shareOrderTest() async {
    setLoading(true);
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final videoRef = storageRef.child("kenya@email.com/1/video.mp4");
      final dir = await getApplicationDocumentsDirectory();
      final videoFile = File('${dir.path}/video.mp4');
      await videoRef.writeToFile(videoFile);
      await Share.shareFiles(
        [
          videoFile.path,
        ],
      );
      setLoading(false);
    } catch (e) {
      showCustomSnackBar(
          message: '', duration: const Duration(seconds: 2), title: '$e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> shareOrderTwo(String orderId) async {
    setLoading(true);
    showCustomSnackBar(
        title: 'مشاركة الطلب',
        message: 'جاري مشاركة الطلب',
        duration: const Duration(seconds: 2));
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final videoRef = storageRef.child("$targetBranch/$orderId/video.mp4");
      final firstImageRef =
          storageRef.child("$targetBranch/$orderId/first_image.jpg");
      final secondImageRef =
          storageRef.child("$targetBranch/$orderId/second_image.jpg");
      final dir = await getApplicationDocumentsDirectory();
      final videoFile = File('${dir.path}/video.mp4');
      final firstImageFile = File('${dir.path}/first_image.jpg');
      final secondImageFile = File('${dir.path}/second_image.jpg');
      await videoRef.writeToFile(videoFile);
      await firstImageRef.writeToFile(firstImageFile);
      await secondImageRef.writeToFile(secondImageFile);
      await Share.shareFiles(
        [videoFile.path, firstImageFile.path, secondImageFile.path],
      );
      if (kDebugMode) {
        print('تمت مشاركة الطلب بنجاح');
      }
      setLoading(false);
    } catch (e) {
      if (kDebugMode) {
        setLoading(false);
        print('Error occurred while downloading or sharing file: $e');
      }
    }
  }

  static showCustomSnackBar(
      {required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.share_rounded,
        color: Colors.white,
      ),
    );
  }

  void deleteFile(String path) async {
    try {
      Reference storageRef = FirebaseStorage.instance.ref().child(path);
      await storageRef.delete();
      if (kDebugMode) {
        print('تم حذف الملف بنجاح');
      }
    } catch (e) {
      if (kDebugMode) {
        print('حدث خطأ أثناء حذف الملف: $e');
      }
    }
  }

  void main() {
    deleteFile('path/to/your/file.jpg');
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    Get.off(const LoginView());
  }

  goToIMageView(context, document) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageView(
          document: document,
        ),
      ),
    );
=======
  String get targetCollection => _targetCollection;
  void navigateToAddOrder(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddNewProduct()));
  }

  String videoUrl = '';
  Future<void> initVideo() async {
    videoController = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        videoUrl,
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 10),
    )..initialize().then(
        (value) async {
          await videoController.setLooping(false);
        },
      );
  }

  Future getCurrentUser() async {
    final currentUser = FirebaseAuth.instance.currentUser?.email;
    _targetCollection = currentUser!;
  }

  void shareOrderDataToWhatsApp(Map<String, dynamic> orderData) async {
    String orderText = '';
    orderData.forEach(
      (key, value) {
        orderText += '$key: $value\n';
      },
    );

    final String whatsappUrl =
        'https://wa.me/?text=${Uri.encodeFull(orderText)}';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.to(LoginView());
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
  }

  goToVideoView(context, document, width, height) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(
          videoUrl: document,
<<<<<<< HEAD
          width: width,
          height: height,
=======
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
        ),
      ),
    );
  }
<<<<<<< HEAD
  // void deleteFile(String path) async {
  //   try {
  //     Reference storageRef = FirebaseStorage.instance.ref().child(path);
  //     await storageRef.delete();
  //     print('تم حذف الملف بنجاح');
  //   } catch (e) {
  //     print('حدث خطأ أثناء حذف الملف: $e');
  //   }
  // }

  // void main() {
  //   deleteFile('path/to/your/file.jpg');
  // }
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
=======

  Future<void> shareOrder(
    collection,
    orderId,
  ) async {
    Reference videoRef;
    Reference firstImageRef;
    Reference secondImageRef;
    try {
      setLoading(true);
      final storageRef = FirebaseStorage.instance.ref();
      videoRef = storageRef.child("$collection/$orderId/video.mp4");
      firstImageRef = storageRef.child("$collection/$orderId/first_image.jpg");
      secondImageRef =
          storageRef.child("$collection/$orderId/second_image.jpg");
      final dir = await getApplicationDocumentsDirectory();
      final videoFile = File('${dir.path}/${videoRef.name}.mp4');
      final firstImagFile = File('${dir.path}/${firstImageRef.name}.jpg');
      final secondImageFile = File('${dir.path}/${secondImageRef.name}.jpg');
      await videoRef.writeToFile(videoFile);
      await firstImageRef.writeToFile(firstImagFile);
      await secondImageRef.writeToFile(secondImageFile);

      await Share.shareFiles(
        [
          videoFile.path,
          firstImagFile.path,
          secondImageFile.path,
        ],
      );
    } catch (e) {
      setLoading(false);
      if (kDebugMode) {
        print('Error occurred while downloading file: $e');
      }
    } finally {
      setLoading(false);
    }
  }

  Future<void> shareLocationOnWhatsApp(
      String orderPlace, GeoPoint location) async {
    try {
      setLoading(true);
      double latitude = location.latitude;
      double longitude = location.longitude;
      String locationUrl = "https://maps.google.com/?q=$latitude,$longitude";
      String combinedMessage = "المكان :$orderPlace\n${locationUrl}";
      await Share.share(
        combinedMessage,
      );
    } catch (e) {
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }

  Future<void> shareOrderTwo(collection, orderId, location, context) async {
   
    Reference videoRef;
    Reference firstImageRef;
    Reference secondImageRef;
    try {
      final storageRef = FirebaseStorage.instance.ref();
      videoRef = storageRef.child("$collection/$orderId/video.mp4");
      firstImageRef = storageRef.child("$collection/$orderId/first_image.jpg");
      secondImageRef =
          storageRef.child("$collection/$orderId/second_image.jpg");
      final dir = await getApplicationDocumentsDirectory();
      final videoFile = File('${dir.path}/${videoRef.name}.mp4');
      final firstImagFile = File('${dir.path}/${firstImageRef.name}.jpg');
      final secondImageFile = File('${dir.path}/${secondImageRef.name}.jpg');
      await videoRef.writeToFile(videoFile);
      await firstImageRef.writeToFile(firstImagFile);
      await secondImageRef.writeToFile(secondImageFile);
      String orderLocation =
          "Check out place location:\nhttps://maps.google.com/?q=$location";
      await Share.shareFiles(
        [
          // videoFile.path,
          // firstImagFile.path,
          // secondImageFile.path,
        ],
        text: orderLocation,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while downloading file: $e');
      }
    }
  }

>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
}
