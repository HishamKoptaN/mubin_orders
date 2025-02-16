import 'package:cached_network_image/cached_network_image.dart';
import 'package:mubin_orders/core/all_imports.dart';
import 'package:shimmer/shimmer.dart';

class ImageWidget extends StatelessWidget {
  String imageUrl;
  ImageWidget({
    super.key,
    required this.imageUrl,
  });
  static const String routeName = "ImageView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Center(
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: const SizedBox(),
                ),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
