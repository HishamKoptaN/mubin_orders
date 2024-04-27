import 'dart:io';
import 'package:docs_orders/helpers/constants.dart';
import 'package:docs_orders/helpers/media_query.dart';
import 'package:dough/dough.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../test_one.dart';
import '../db/orders.dart';
import '../views/home_controller.dart';
import 'order.dart';

late VideoPlayerController? fileController;
late OrderDatabase dataCnr;

class StudentCard extends StatelessWidget {
  final cnr = Get.put(HomeController());
  StudentCard(
      {Key? key,
      required this.student,
      required this.onDelete,
      required this.controller})
      : super(key: key);

  final Order student;
  final Function(Order) onDelete;
  late File? videoFile;

  final controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (cnr) {
        return PressableDough(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Get.theme.brightness == Brightness.dark
                ? Get.theme.colorScheme.surfaceVariant
                : Get.theme.colorScheme.surface,
            child: SizedBox(
              width: context.screenWidth * 95,
              height: context.screenHeight * 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'المكان :${student.place}',
                            style: Get.textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: context.screenWidth * 35,
                            height: context.screenHeight * 26,
                            child: VideoScreen(
                              videoPath: student.video,
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () async {
                          //     await cnr.replaceViedo(
                          //         student.id,
                          //         student.place,
                          //         student.firstImage,
                          //         student.secondImage,
                          //         student.video,
                          //         student.latitude,
                          //         student.latitude);
                          //   },
                          //   child: Icon(
                          //     Icons.swap_horiz,
                          //     size: context.screenSize * 0.15,
                          //   ),
                          // ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: context.screenWidth * 25,
                            height: context.screenHeight * 19,
                            child: student.firstImage == ''
                                ? IconButton(
                                    icon: Icon(
                                        Icons.add_photo_alternate_outlined,
                                        size: context.screenSize * 0.30,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    onPressed: () async {
                                      await controller.addFirstImage(
                                          student.id,
                                          student.place,
                                          student.firstImage,
                                          student.secondImage,
                                          student.video,
                                          student.latitude,
                                          student.latitude);
                                    },
                                  )
                                : Image.file(
                                    File(student.firstImage),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.addFirstImage(
                                  student.id,
                                  student.place,
                                  student.firstImage,
                                  student.secondImage,
                                  student.video,
                                  student.latitude,
                                  student.latitude);
                            },
                            child: student.firstImage.isEmpty
                                ? SizedBox(
                                    height: context.screenHeight * 4,
                                  )
                                : Icon(
                                    Icons.swap_horiz,
                                    size: context.screenSize * 0.15,
                                  ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: context.screenWidth * 25,
                            height: context.screenHeight * 19,
                            child: student.secondImage == ''
                                ? IconButton(
                                    icon: Icon(
                                        Icons.add_photo_alternate_outlined,
                                        size: context.screenSize * 0.30,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    onPressed: () async {
                                      await controller.addSecondImage(
                                          student.id,
                                          student.place,
                                          student.firstImage,
                                          student.secondImage,
                                          student.video,
                                          student.latitude,
                                          student.latitude);
                                    },
                                  )
                                : Image.file(
                                    File(student.secondImage),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.addSecondImage(
                                  student.id,
                                  student.place,
                                  student.firstImage,
                                  student.secondImage,
                                  student.video,
                                  student.latitude,
                                  student.latitude);
                            },
                            child: student.secondImage.isEmpty
                                ? SizedBox(
                                    height: context.screenHeight * 4,
                                  )
                                : Icon(
                                    Icons.swap_horiz,
                                    size: context.screenSize * 0.15,
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          onDelete(student);
                        },
                        child: Container(
                          height: context.screenHeight * 5,
                          width: context.screenWidth * 15,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.delete_forever,
                                  size: context.screenSize * 0.10,
                                  color: const Color.fromARGB(255, 116, 12, 5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // await shareVideoAndImagesAndLocation(
                          //     student.video, student.video, student.video);
                          await cnr.shareOrderLocation(
                              student.place,
                              student.video,
                              student.firstImage,
                              student.secondImage,
                              student.latitude,
                              student.longitude);
                        },
                        child: Container(
                          height: context.screenHeight * 5,
                          width: context.screenWidth * 20,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.share,
                                size: context.screenSize * 0.10,
                                color: Colors.white,
                              ),
                              MyText(
                                fieldName: 'الموقع',
                                fontSize: context.screenSize * fourFont,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // await shareVideoAndImagesAndLocation(
                          //     student.video, student.video, student.video);
                          await cnr.shareVideo(
                              student.place,
                              student.video,
                              student.firstImage,
                              student.secondImage,
                              student.latitude,
                              student.longitude);
                        },
                        child: Container(
                          height: context.screenHeight * 5,
                          width: context.screenWidth * 25,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.share,
                                size: context.screenSize * 0.10,
                                color: Colors.white,
                              ),
                              MyText(
                                fieldName: 'مشاركة',
                                fontSize: context.screenSize * fourFont,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
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

//  Future<void> updateOrder(String place, String video, String firstImage,
//       String secondImage, double latitude, double longitude) async {
//     try {
//       place = place.trim();
//       Order order = Order(
//         place: place,
//         video: video,
//         firstImage: firstImage,
//         secondImage: secondImage,
//         latitude: latitude,
//         longitude: longitude,
//       );
//       order.id = await OrderDatabase.instance.updateOrder(order);
//       order.latitude = latitude;
//       order.longitude = longitude;
//       Get.find<StudentListController>().addStudent(order);
//       Get.back();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

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

  // late File _videoFileTwo;
  // late File _imageFile1;
  // late File _imageFile2;
  // double _latitude = 0.0; // تعيين القيمة الافتراضية لخط العرض
  // double _longitude = 0.0; // تعيين القيمة الافتراضية لخط الطول

  // Future<void> _shareVideoAndImagesAndLocation(
  //     String videoPath, String imagePath1, String imagePath2) async {
  //   _videoFile = File(videoPath);
  //   _imageFile1 = File(imagePath1);
  //   _imageFile2 = File(imagePath2);

  //   // التحقق من وجود الملفات
  //   if (_videoFileTwo.existsSync() &&
  //       _imageFile1.existsSync() &&
  //       _imageFile2.existsSync()) {
  //     // إعداد رسالة المشاركة
  //     String message = 'Check out my video, images, and location:\n'
  //         'Video: ${_videoFile!.path}\n'
  //         'Image 1: ${_imageFile1.path}\n'
  //         'Image 2: ${_imageFile2.path}\n'
  //         'Location: https://maps.google.com/?q=$_latitude,$_longitude';

  //     // مشاركة الملفات
  //     await Share.shareFiles(
  //       [_videoFile!.path, _imageFile1.path, _imageFile2.path],
  //       text: message,
  //     );
  //   } else {
  //     print('One or more files do not exist!');
  //   }
  // }
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
          fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}

class MyImage extends StatefulWidget {
  String imagePath;
  MyImage({super.key, required this.imagePath});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return widget.imagePath == ''
        ? IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        : Image.file(File(widget.imagePath));
  }
}
