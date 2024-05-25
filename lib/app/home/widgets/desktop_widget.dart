import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../generated/l10n.dart';
import '../../../main.dart';
import '../home_controller.dart';
import 'video_widget.dart';
import 'widgets.dart';

class DesktopWidget extends StatelessWidget {
  const DesktopWidget({
    super.key,
    required this.document,
    required this.proId,
  });

  final DocumentSnapshot<Object?> document;
  final String proId;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        value.goToVideoView(
                            context, document['order_video'], width, height);
                      },
                      child: VideoWidget(
                        videoUrl: document['order_video'],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        value.goToIMageView(
                            context, document['order_first_image']);
                      },
                      child: CachedNetworkImage(
                        imageUrl: document['order_first_image'],
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: const SizedBox(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        value.goToIMageView(
                            context, document['order_second_image']);
                      },
                      child: CachedNetworkImage(
                        imageUrl: document['order_second_image'],
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: const SizedBox(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyText(
                      fieldName:
                          '${S.of(context).order_id}: ${document['order_id']}',
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: MyText(
                      fieldName:
                          '${S.of(context).order_place}: ${document['place_name']}',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Spacer(),
            //       Expanded(
            //         flex: 2,
            //         child: GestureDetector(
            //           onTap: () async {
            //             // await value.shareOrderTwo(proId);
            //             await value.shareOrderTest();
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //               border: Border.all(color: Colors.green),
            //               borderRadius: const BorderRadius.all(
            //                 Radius.circular(50),
            //               ),
            //             ),
            //             child: Icon(
            //               Icons.share,
            //               size: setFont(context, 40),
            //               color: Colors.green,
            //             ),
            //           ),
            //         ),
            //       ),
            //       const Spacer(),
            //       Expanded(
            //         flex: 2,
            //         child: GestureDetector(
            //           onTap: () async {
            //             value.shareLocationOnWhatsApp(
            //                 document['place_name'], document['order_location']);
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //               border: Border.all(color: Colors.green),
            //               borderRadius: const BorderRadius.all(
            //                 Radius.circular(50),
            //               ),
            //             ),
            //             child: Icon(
            //               Icons.location_on,
            //               size: setFont(context, 40),
            //               color: Colors.green,
            //             ),
            //           ),
            //         ),
            //       ),
            //       const Spacer(),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
