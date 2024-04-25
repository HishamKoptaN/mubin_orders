import 'dart:io';
import 'package:dough/dough.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import '../global/values.dart';
import 'student.dart';
import 'package:share_plus/share_plus.dart';

class StudentCard extends StatelessWidget {
  StudentCard({Key? key, required this.student, required this.onDelete})
      : super(key: key);

  final Student student;
  final Function(Student) onDelete;
  late File? _videoFile;
  @override
  Widget build(BuildContext context) {
    return PressableDough(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Get.theme.brightness == Brightness.dark
            ? Get.theme.colorScheme.surfaceVariant
            : Get.theme.colorScheme.surface,
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 /
                          9, // يمكنك تعيين نسبة العرض إلى الارتفاع لعنصر الفيديو
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: VideoPlayer(
                          VideoPlayerController.file(
                            File(
                                "${Values.appDirectory!.path}/${student.image}"), // استبدل `student.video` بمسار ملف الفيديو الخاص بالطالب
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        student.image,
                        style: Get.textTheme.titleLarge,
                      ),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            print(student.image);
                            await _shareVideo(student.image);
                          },
                          child: const Text("مشاركة"),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareVideo(String path) async {
    _videoFile = File(path);
    if (_videoFile != null && _videoFile!.existsSync()) {
      await Share.shareFiles([_videoFile!.path], text: 'Check out this video!');
    } else {
      print('Video file does not exist!');
    }
  }
}
