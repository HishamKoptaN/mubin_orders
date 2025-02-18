import 'package:mubin_orders/core/all_imports.dart';
import 'package:mubin_orders/core/gloabal_widgets/video_player.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/gloabal_widgets/gloabal_widgets.dart';
import '../../../data/models/orders_res_model.dart';
import 'image_preview.dart';
import 'video_widget.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.order,
  });
  final Order order;
  static const String routeName = "OrderWidget";

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
                    child: Image.network(
                      order.imageOne ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Container(
                            color: Colors.white,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
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
                          'image_url': order.imageTwo ?? '',
                        },
                      );
                    },
                    child: Image.network(
                      order.imageTwo ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Container(
                            color: Colors.white,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
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
