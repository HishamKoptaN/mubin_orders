import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CachedVideoPlayerPlusController controller;
  String targetCollection = '';
  var videoUrl = ''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await getCurrentUser();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future<void> initVideo(videoUrl) async {
    controller = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        videoUrl,
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(days: 2),
    )..initialize().then(
        (value) async {
          await controller.setLooping(true);
        },
      );
  }

  Future<void> getCurrentUser() async {
    final currentUserRole = FirebaseAuth.instance.currentUser?.email;
    switch (currentUserRole) {
      case 'somal@email.com':
        targetCollection = 'somal_orders';
      case 'kinia@email.com':
        targetCollection = 'kinia_orders';
      case 'tanzania@email.com':
        targetCollection = 'tanzania_orders';
    }
  }

  void shareFile(String filePath) {}
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
}
