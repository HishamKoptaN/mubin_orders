import 'dart:io';
import 'package:docs_orders/helpers/constants.dart';
import 'package:docs_orders/helpers/media_query.dart';
import 'package:dough/dough.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../test_one.dart';
import 'student.dart';
import 'package:share_plus/share_plus.dart';

late VideoPlayerController? fileController;

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
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Get.theme.brightness == Brightness.dark
            ? Get.theme.colorScheme.surfaceVariant
            : Get.theme.colorScheme.surface,
        child: SizedBox(
          width: context.screenWidth * 95,
          height: context.screenHeight * 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: context.screenWidth * 35,
                    height: context.screenHeight * 27,
                    child: VideoScreen(
                      videoPath: student.image,
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                width: context.screenWidth * 40,
                height: context.screenHeight * 30,
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          student.name,
                          style: Get.textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            onDelete(student);
                          },
                          child: Container(
                            height: context.screenHeight * 5,
                            width: context.screenWidth * 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 162, 29, 29),
                              border: Border.all(),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                fieldName: "مسح",
                                fontSize: context.screenSize * sixFont,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            print(student.image);
                            await _shareVideo(student.image);
                          },
                          child: Container(
                            height: context.screenHeight * 5,
                            width: context.screenWidth * 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 124, 27),
                              border: Border.all(color: Colors.grey),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                fieldName: 'مشاركة',
                                fontSize: context.screenSize * sixFont,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  buildVideoPlayer(VideoPlayerController controller) {
    return Column(
      children: [
        Center(
          child: controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                )
              : Container(),
        ),
      ],
    );
  }

  Future<void> _shareVideo(String path) async {
    _videoFile = File(path);
    if (_videoFile != null && _videoFile!.existsSync()) {
      await Share.shareFiles([_videoFile!.path]);
    } else {
      print('Video file does not exist!');
    }
  }

  setVedioFile(String path) async {
    final file = File(path);
    fileController = VideoPlayerController.file(file)
      ..initialize().then(
        (_) {
          fileController?.play();
        },
      );
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result == null) return null;
    print(result.files.single.path);
    return File(result.files.single.path.toString());
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.fieldName,
    required this.fontSize,
  });

  final double fontSize;
  final String fieldName;
  @override
  Widget build(BuildContext context) {
    return Text(
      fieldName,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
