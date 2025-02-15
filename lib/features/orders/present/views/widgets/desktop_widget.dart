import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/gloabal_widgets/gloabal_widgets.dart';
import '../../../data/models/orders_res_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'video_widget.dart';

class DesktopWidget extends StatelessWidget {
  const DesktopWidget({
    super.key,
    required this.order,
  });

  final Order order;
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
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
                    // value.goToVideoView(
                    //     context, document['order_video'], width, height);
                  },
                  child: VideoWidget(
                    videoUrl: order.video ?? '',
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
              SizedBox(
                width: 200,
                height: 50,
                child: FittedBox(
                  child: Text(
                    '${t.order_id}: ${order.id.toString()}',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Expanded(
                child: MyText(
                  fieldName: '${t.order_id}: ${order.id.toString()}',
                  color: Colors.blue,
                  fontSize: 10,
                ),
              ),
              Expanded(
                child: MyText(
                  fieldName: '${t.order_place}: ${order.place}',
                  color: Colors.black,
                  fontSize: 10,
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
  }
}
