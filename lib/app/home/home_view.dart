import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_talabat/global/media_query.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import '../../generated/l10n.dart';
import '../add_data/controllers/admin_products.controller.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final addData = AdminProductsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (cnr) {
          return Column(
            children: [
              StreamBuilder(
                stream:
                    cnr.firestore.collection(cnr.targetCollection).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        S.of(context).loading,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: ShimmerEffect(
                        baseColor: Colors.white,
                        highlightColor: Colors.green,
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Divider(
                                thickness: 6,
                                color: Colors.red,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                S.of(context).loading,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                        width: context.screenWidth * 95,
                        height: context.screenHeight * 76,
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot document =
                                snapshot.data!.docs[index];
                            String proId = document.id;
                            cnr.initVideo(document['order_video']);
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Get.theme.brightness == Brightness.dark
                                    ? Get.theme.colorScheme.surfaceVariant
                                    : Get.theme.colorScheme.surface,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: context.screenHeight * 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '${S.of(context).order_place} : ${document['place_name']}',
                                          style: Get.textTheme.titleLarge,
                                        ),
                                        Text(
                                          '${S.of(context).order_id}: ${document['order_id']}',
                                          style: Get.textTheme.titleLarge,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: context.screenHeight * 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: context.screenWidth * 35,
                                          height: context.screenHeight * 17,
                                          child: CachedVideoPlayerPlus(
                                              cnr.controller),
                                        ),
                                        SizedBox(
                                          width: context.screenWidth * 25,
                                          height: context.screenHeight * 17,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                document['order_first_image'],
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.red,
                                              highlightColor: Colors.yellow,
                                              child: const SizedBox(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: context.screenWidth * 25,
                                          height: context.screenHeight * 17,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                document['order_second_image'],
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.red,
                                              highlightColor: Colors.yellow,
                                              child: const SizedBox(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: context.screenHeight * 1,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.fieldName,
    required this.fontSize,
    required this.color,
  });

  final double fontSize;
  final String fieldName;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fieldName,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
