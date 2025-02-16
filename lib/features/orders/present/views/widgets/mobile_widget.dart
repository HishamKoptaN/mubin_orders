import 'package:cached_network_image/cached_network_image.dart';
import 'package:mubin_orders/core/all_imports.dart';
import 'package:mubin_orders/core/gloabal_widgets/video_player.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/gloabal_widgets/gloabal_widgets.dart';
import '../../../../../core/gloabal_widgets/image_widget.dart';
import '../../../data/models/orders_res_model.dart';
import '../orders_view.dart';
import 'image_preview.dart';
import 'video_widget.dart';

class MobileHomeWidget extends StatelessWidget {
  const MobileHomeWidget({
    super.key,
    required this.order,
  });
  final Order order;
  static const String routeName = "MobileHomeWidget";

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [   Expanded(
                          flex: 1,
                          child: MyText(
                            fieldName: '${t.order_id}: ${order.id.toString()}',
                            color: Colors.blue,
                            fontSize: 15.sp,
                          ),
                        ),
                 Expanded(
                          flex: 1,
                          child: MyText(
                            fieldName: '${t.order_place}: ${order.place}',
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
               
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        VideoPlayerView.routeName,
                        arguments: {
                          'video_url': order.video ?? '',
                        },
                      );
                    },
                    child: VideoWidget(
                      videoUrl: order.video ?? '',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        ImagePreview.routeName,
                        arguments: {
                          'image_url': order.imageOne ?? '',
                        },
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: order.imageOne ?? '',
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: const SizedBox(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        ImagePreview.routeName,
                        arguments: {'image_url': order.imageTwo ?? ''},
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: order.imageTwo ?? '',
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: const SizedBox(),
                      ),
                      errorWidget: (
                        context,
                        url,
                        error,
                      ) =>
                          const Icon(
                        Icons.error,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

  // Future<void> shareOrderTwo(collection, orderId, location, context) async {
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
  //     String orderLocation =
  //         "Check out place location:\nhttps://maps.google.com/?q=$location";
  //     await Share.shareFiles(
  //       [
  //         // videoFile.path,
  //         // firstImagFile.path,
  //         // secondImageFile.path,
  //       ],
  //       text: orderLocation,
  //     );
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error occurred while downloading file: $e');
  //     }
  //   }
  // }


   // Expanded(
                //   flex: 1,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // Expanded(
                //       //   flex: 1,
                //       //   child: GestureDetector(
                //       //     onTap: () async {
                //       //       await shareOrderTwo(
                //       //         proId,
                //       //       );
                //       //     },
                //       //     child: Container(
                //       //       decoration: BoxDecoration(
                //       //         border: Border.all(color: Colors.green),
                //       //         borderRadius: const BorderRadius.all(
                //       //           Radius.circular(50),
                //       //         ),
                //       //       ),
                //       //       child: const Icon(
                //       //         Icons.share,
                //       //         color: Colors.green,
                //       //       ),
                //       //     ),
                //       //   ),
                //       // ),
                //       Gap(
                //         10.w,
                //       ),
                //       Expanded(
                //         flex: 1,
                //         child: GestureDetectorWidget(
                //           onTap: () {
                //             // value.shareLocationOnWhatsApp(
                //             //     document['place_name'],
                //             //     document['order_location']
                //             // );
                //           },
                //           // document: document,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),