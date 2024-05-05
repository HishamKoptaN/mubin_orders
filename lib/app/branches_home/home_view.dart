import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_admin/helpers/media_query.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import '../../drawer/my_drawer.dart';
import '../../generated/l10n.dart';
import '../../helpers/constants.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key});
  final cnr = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   child: IconButton(
        //     onPressed: () {
        //       cnr.signOut();
        //     },
        //     icon: const Icon(Icons.logout),
        //     iconSize: context.screenSize * 0.10,
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          S.of(context).home_title,
          style: TextStyle(
            color: Colors.black,
            fontSize: context.screenSize * sevenFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Text(
        //   cnr.title,
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: context.screenSize * sevenFont,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      drawer: const MyDrawer(),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (cnr) {
          return Column(
            children: [
              SizedBox(
                height: context.screenHeight * 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cnr.isArabic()
                      ? cnr.branchArData.length
                      : cnr.branchEnData.length,
                  itemBuilder: (BuildContext context, int index) {
                    var branch = cnr.isArabic()
                        ? cnr.branchArData[index]
                        : cnr.branchEnData[index];
                    return SizedBox(
                      width: context.screenWidth * 45,
                      height: context.screenHeight * 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            cnr.setCurrentIndex(index);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: context.screenHeight * 5,
                                width: context.screenWidth * 40,
                                color: Colors.green,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CountryFlag.fromCountryCode(
                                      branch['flag'],
                                      height: 35,
                                      width: 35,
                                      borderRadius: 120,
                                    ),
                                    MyText(
                                      fieldName: branch['name'],
                                      fontSize: context.screenSize * fiveFont,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 3,
                                color: index == cnr.currentIndex
                                    ? Colors.red
                                    : Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                height: context.screenHeight * 78,
                width: context.screenWidth * 95,
                child: GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (cnr) {
                    return Column(
                      children: [
                        StreamBuilder(
                          stream: cnr.firestore
                              .collection(cnr.targetBranch)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: ShimmerEffect(
                                  baseColor: Colors.white,
                                  highlightColor: Colors.green,
                                  child: const SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Divider(
                                          thickness: 6,
                                          color: Colors.red,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          'Loading...',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: ShimmerEffect(
                                  baseColor: Colors.white,
                                  highlightColor: Colors.green,
                                  child: const SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Divider(
                                          thickness: 6,
                                          color: Colors.red,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          'Loading...',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 24),
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
                                  height: context.screenHeight * 78,
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      DocumentSnapshot document =
                                          snapshot.data!.docs[index];
                                      String proId = document.id;
                                      cnr.initVideo(document['order_video']);

                                      return Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Card(
                                          semanticContainer: true,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Get.theme.brightness ==
                                                  Brightness.dark
                                              ? Get.theme.colorScheme
                                                  .surfaceVariant
                                              : Get.theme.colorScheme.surface,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height:
                                                    context.screenHeight * 1,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    '${S.of(context).order_id}: ${document['order_id']}',
                                                    style: Get
                                                        .textTheme.titleLarge,
                                                  ),
                                                  Text(
                                                    '${S.of(context).order_place}: ${document['place_name']}',
                                                    style: Get
                                                        .textTheme.titleLarge,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await cnr.shareOrder(
                                                          'somal_orders',
                                                          proId,
                                                          document[
                                                              'order_location']);
                                                    },
                                                    child: Container(
                                                      height:
                                                          context.screenHeight *
                                                              5,
                                                      width:
                                                          context.screenWidth *
                                                              20,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.green),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(50),
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.share,
                                                        size:
                                                            context.screenSize *
                                                                0.10,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                    context.screenHeight * 1,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: context.screenWidth *
                                                        35,
                                                    height:
                                                        context.screenHeight *
                                                            17,
                                                    child:
                                                        CachedVideoPlayerPlus(
                                                            cnr.controller),
                                                  ),
                                                  SizedBox(
                                                    width: context.screenWidth *
                                                        25,
                                                    height:
                                                        context.screenHeight *
                                                            17,
                                                    child: CachedNetworkImage(
                                                      imageUrl: document[
                                                          'order_first_image'],
                                                      placeholder: (context,
                                                              url) =>
                                                          Shimmer.fromColors(
                                                        baseColor: Colors.red,
                                                        highlightColor:
                                                            Colors.yellow,
                                                        child: const SizedBox(),
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: context.screenWidth *
                                                        25,
                                                    height:
                                                        context.screenHeight *
                                                            17,
                                                    child: CachedNetworkImage(
                                                      imageUrl: document[
                                                          'order_second_image'],
                                                      placeholder: (context,
                                                              url) =>
                                                          Shimmer.fromColors(
                                                        baseColor: Colors.red,
                                                        highlightColor:
                                                            Colors.yellow,
                                                        child: const SizedBox(),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                    context.screenHeight * 1,
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
              )
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