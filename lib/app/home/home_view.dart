<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbean_admin/main.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import '../drawer/my_drawer.dart';
import '../../generated/l10n.dart';
import '../../helpers/responsive.dart';
import 'home_controller.dart';
import 'widgets/branches_widget.dart';
import 'widgets/desktop_widget.dart';
import 'widgets/mobile_widget.dart';
import 'widgets/widgets.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    @override
    void initState() {
      super.initState();
      homeController.setCurrentIndex(0);
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).home_title,
          style: TextStyle(
            color: Colors.black,
            fontSize: setFont(context, 30),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Selector<HomeProvider, String>(
        selector: (context, provider) => provider.targetBranch,
        builder: (context, targetBranch, child) {
          return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: BranchesWidget(width: width),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection(targetBranch)
                                .orderBy('order_id')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: ShimmerEffect(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.green,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Divider(
                                          thickness: 6,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'Loading...',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: setFont(context, 40),
                                          ),
                                        ),
                                      ],
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
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Divider(
                                          thickness: 6,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'Loading...',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Expanded(
                                  flex: 7,
                                  child: Stack(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            DocumentSnapshot document =
                                                snapshot.data!.docs[index];
                                            String proId = document.id;
                                            return Expanded(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: height / 3,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: Card(
                                                      semanticContainer: true,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: Get.theme
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Get
                                                              .theme
                                                              .colorScheme
                                                              .surfaceVariant
                                                          : Get
                                                              .theme
                                                              .colorScheme
                                                              .surface,
                                                      child: Res.isMobile(
                                                              context)
                                                          ? MobileHomeWidget(
                                                              document:
                                                                  document,
                                                              proId: proId)
                                                          : DesktopWidget(
                                                              document:
                                                                  document,
                                                              proId: proId),
=======
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:mbean_talabat/app/image_view/image_view.dart';
import 'package:mbean_talabat/global/media_query.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import '../../generated/l10n.dart';
import '../../global/constants.dart';
import '../drawer/my_drawer.dart';
import '../gloabal_widgets/gloabal_widgets.dart';
import '../video_player.dart';
import 'video_widget.dart';
import 'home_controller.dart';
import '../gloabal_widgets/loading_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Selector<HomeProvider, String>(
      selector: (context, cnr) => cnr.targetCollection,
      builder: ((context, value, child) {
        return Scaffold(
          drawer: MyDrawer(),
          body: Stack(
            children: [
              Column(
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection(value)
                        .orderBy('order_id')
                        .snapshots(),
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
                            height: context.screenHeight * 73,
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot document =
                                    snapshot.data!.docs[index];
                                String proId = document.id;

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
                                    color: Get.theme.brightness ==
                                            Brightness.dark
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: context.screenWidth * 1,
                                            ),
                                            SizedBox(
                                              width: context.screenWidth * 50,
                                              height: context.screenHeight * 8,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  MyText(
                                                    fieldName:
                                                        '${S.of(context).order_id}: ${document['order_id']}',
                                                    fontSize:
                                                        context.screenSize *
                                                            fourFont,
                                                    color: Colors.blue,
                                                  ),
                                                  MyText(
                                                    fieldName:
                                                        '${S.of(context).order_place}: ${document['place_name']}',
                                                    fontSize:
                                                        context.screenSize *
                                                            threeFont,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              width: context.screenWidth * 30,
                                              height: context.screenHeight * 8,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await homeController
                                                          .shareOrder(
                                                              homeController
                                                                  .targetCollection,
                                                              proId);
                                                    },
                                                    child: Container(
                                                      height:
                                                          context.screenHeight *
                                                              3.5,
                                                      width:
                                                          context.screenWidth *
                                                              10,
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
                                                  GestureDetector(
                                                    onTap: () async {
                                                      homeController
                                                          .shareLocationOnWhatsApp(
                                                              document[
                                                                  'place_name'],
                                                              document[
                                                                  'order_location']);
                                                    },
                                                    child: Container(
                                                      height:
                                                          context.screenHeight *
                                                              3.5,
                                                      width:
                                                          context.screenWidth *
                                                              10,
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
                                                        Icons.location_on,
                                                        size:
                                                            context.screenSize *
                                                                0.10,
                                                        color: Colors.green,
                                                      ),
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
                                                    ),
                                                  ),
                                                ],
                                              ),
<<<<<<< HEAD
                                            );
                                          },
                                        ),
                                      ),
                                      Selector<HomeProvider, bool>(
                                        selector: (_, provider) =>
                                            provider.isLoading,
                                        builder: (context, isLoading, child) {
                                          if (isLoading) {
                                            return Center(
                                              child: Center(
                                                child: Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    width: width / 3,
                                                    height: height / 3,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromARGB(0, 158,
                                                              158, 158)),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          MyText(
                                                            fieldName:
                                                                'جاري مشاركة الطلب ',
                                                            color: Colors.black,
                                                          ),
                                                          CircularProgressIndicator(),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          );
        },
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  GestureDetectorWidget({
    super.key,
    required Null Function() onTap,
    required this.document,
  });

  final DocumentSnapshot<Object?> document;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.green,
        ),
      ),
=======
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
                                            GestureDetector(
                                              onTap: () async {
                                                Get.to(
                                                  VideoPlayerScreen(
                                                    videoUrl:
                                                        document['order_video'],
                                                  ),
                                                );
                                              },
                                              child: SizedBox(
                                                width: context.screenWidth * 35,
                                                height:
                                                    context.screenHeight * 17,
                                                child: VideoWidget(
                                                  videoUrl:
                                                      document['order_video'],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.screenWidth * 25,
                                              height: context.screenHeight * 17,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                    ImageView(
                                                      document: document[
                                                          'order_first_image'],
                                                    ),
                                                  );
                                                },
                                                child: CachedNetworkImage(
                                                  imageUrl: document[
                                                      'order_first_image'],
                                                  placeholder: (context, url) =>
                                                      Shimmer.fromColors(
                                                    baseColor: Colors.red,
                                                    highlightColor:
                                                        Colors.yellow,
                                                    child: const SizedBox(),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.screenWidth * 25,
                                              height: context.screenHeight * 17,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                    ImageView(
                                                      document: document[
                                                          'order_second_image'],
                                                    ),
                                                  );
                                                },
                                                child: CachedNetworkImage(
                                                  imageUrl: document[
                                                      'order_second_image'],
                                                  placeholder: (context, url) =>
                                                      Shimmer.fromColors(
                                                    baseColor: Colors.red,
                                                    highlightColor:
                                                        Colors.yellow,
                                                    child: const SizedBox(),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  fit: BoxFit.cover,
                                                ),
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
              ),
              Selector<HomeProvider, bool>(
                selector: (_, provider) => provider.isLoading,
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return LoadingWIdget(
                      width: width,
                      height: height,
                      text: S.of(context).request_sharing,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        );
      }),
>>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
    );
  }
}
