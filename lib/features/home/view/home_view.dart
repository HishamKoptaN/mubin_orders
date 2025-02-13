import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mbean_talabat/core/widgets/image_view/image_view.dart';
import 'package:mbean_talabat/core/global/media_query.dart';
import 'package:shimmer/shimmer.dart';
import '../../../generated/l10n.dart';
import '../../../core/gloabal_widgets/loading_widget.dart';
import '../../video_player.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/video_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(FetchOrders()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is HomeLoading) {
              LoadingWidget(
                width: width,
                height: height,
                text: S.of(context).request_saving,
                progress: 1,
              );
            }
            if (state is OrdersLoadedSuccessfully) {
              if (state.orders != null && state.orders!.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.orders!.length,
                  itemBuilder: (context, index) {
                    var document = state.orders![index];
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     MyText(
                            //       fieldName:
                            //           '${S.of(context).order_id}: ${document.id}',
                            //       fontSize: context.screenSize * 4,
                            //       color: Colors.blue,
                            //     ),
                            //     MyText(
                            //       fieldName:
                            //           '${S.of(context).order_place}: ${document.place}',
                            //       fontSize: context.screenSize * 3,
                            //       color: Colors.black,
                            //     ),
                            //   ],
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SizedBox(
                                //   width: context.screenWidth * 30,
                                //   height: context.screenHeight * 8,
                                //   child: const Column(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                // GestureDetector(
                                //   onTap: () async {
                                //   },
                                //   child: Container(
                                //     height: context.screenHeight * 3.5,
                                //     width: context.screenWidth * 10,
                                //     decoration: BoxDecoration(
                                //       border:
                                //           Border.all(color: Colors.green),
                                //       borderRadius:
                                //           const BorderRadius.all(
                                //         Radius.circular(50),
                                //       ),
                                //     ),
                                //     child: Icon(
                                //       Icons.share,
                                //       size: context.screenSize * 0.10,
                                //       color: Colors.green,
                                //     ),
                                //   ),
                                // ),
                                // GestureDetector(
                                //   onTap: () async {
                                //     // if (document.place != null &&
                                //     //     document.orderLocation != null) {
                                //     //   // Implement share location functionality
                                //     // }
                                //   },
                                //   child: Container(
                                //     height: context.screenHeight * 3.5,
                                //     width: context.screenWidth * 10,
                                //     decoration: BoxDecoration(
                                //       border:
                                //           Border.all(color: Colors.green),
                                //       borderRadius:
                                //           const BorderRadius.all(
                                //         Radius.circular(50),
                                //       ),
                                //     ),
                                //     child: Icon(
                                //       Icons.location_on,
                                //       size: context.screenSize * 0.10,
                                //       color: Colors.green,
                                //     ),
                                //   ),
                                // ),
                                //       ],
                                //     ),
                                //   ),
                                // ],
                                // ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 150.h,
                                      width: 100.w,
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (document.video != null &&
                                              document.video!.isNotEmpty) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayerScreen(
                                                  videoUrl:
                                                      document.video ?? "",
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: SizedBox(
                                          width: context.screenWidth * 35,
                                          height: context.screenHeight * 17,
                                          child: VideoWidget(
                                            videoUrl: document.video ?? "",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(2.w),
                                    SizedBox(
                                      height: 150.h,
                                      width: 100.w,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (document.imageOne != null &&
                                              document.imageOne!.isNotEmpty) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ImageView(
                                                  imageUrl:
                                                      document.imageOne ?? "",
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: document.imageOne ?? "",
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor:
                                                Colors.grey.shade100,
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: Colors.white,
                                            ),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Gap(2.w),
                                    SizedBox(
                                      height: 150.h,
                                      width: 100.w,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (document.imageOne != null &&
                                              document.imageOne!.isNotEmpty) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ImageView(
                                                  imageUrl:
                                                      document.imageTwo ?? "",
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: document.imageTwo ?? "",
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor:
                                                Colors.grey.shade100,
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: Colors.white,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
            return Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
