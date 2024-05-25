import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../generated/l10n.dart';
import '../../image_view/image_view.dart';
import '../../video_player/video_player.dart';
import '../home_controller.dart';
import '../home_view.dart';
import 'video_widget.dart';
import 'widgets.dart';
import 'package:provider/provider.dart';

class MobileHomeWidget extends StatelessWidget {
  MobileHomeWidget({
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
        value.setCurrentIndex(0);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: MyText(
                              fieldName:
                                  '${S.of(context).order_id}: ${document['order_id']}',
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: MyText(
                              fieldName:
                                  '${S.of(context).order_place}: ${document['place_name']}',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () async {
                              await value.shareOrderTwo(
                                proId,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: const Icon(
                                Icons.share,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetectorWidget(
                              onTap: () {
                                value.shareLocationOnWhatsApp(
                                    document['place_name'],
                                    document['order_location']);
                              },
                              document: document),
                        ),
                      ],
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
                        value.goToVideoView(
                            context, document['order_video'], width, height);
                      },
                      child: VideoWidget(
                        videoUrl: document['order_video'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
