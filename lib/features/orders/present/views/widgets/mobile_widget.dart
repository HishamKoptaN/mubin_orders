import 'package:cached_network_image/cached_network_image.dart';
import 'package:mubin_orders/core/all_imports.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/gloabal_widgets/gloabal_widgets.dart';
import '../../../data/models/orders_res_model.dart';
import '../orders_view.dart';
import 'video_widget.dart';

class MobileHomeWidget extends StatelessWidget {
  const MobileHomeWidget({
    super.key,
    required this.order,
  });
  final Order order;
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            // await value.shareOrderTwo(
                            //   proId,
                            // );
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
                      Gap(
                        10.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetectorWidget(
                          onTap: () {
                            // value.shareLocationOnWhatsApp(
                            //     document['place_name'],
                            //     document['order_location']
                            // );
                          },
                          // document: document,
                        ),
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
                      // value.goToVideoView(
                      //     context, document['order_video'], width, height);
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
                      // value.goToIMageView(
                      //     context, document['order_first_image']);
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
                      // value.goToIMageView(
                      //     context, document['order_second_image']);
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
