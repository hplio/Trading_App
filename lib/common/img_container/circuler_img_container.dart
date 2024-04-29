import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/loader/shimmer.dart';
import 'package:trading_app/constants/colors.dart';

class KCirculerImage extends StatelessWidget {
  const KCirculerImage({
    super.key,
    this.isNetworkImg = false,
    this.width = 56,
    this.hight = 56,
    required this.imgString,
    this.fit = BoxFit.cover,
    this.imgColor,
    this.bgColor,
  });

  final bool isNetworkImg;
  final double width;
  final double hight;
  final String imgString;
  final BoxFit? fit;
  final Color? imgColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: width,
      height: hight,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: bgColor ?? (dark ? TColor.black : TColor.white),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImg
              ? CachedNetworkImage(
                  color: imgColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const KShimmerEffect(
                    hight: 55,
                    width: 55,
                    radius: 55,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: imgString,
                )
              : Image(
                  // fit: fit,
                  image: AssetImage(
                    imgString,
                  ),
                  color: imgColor,
                ),
        ),
      ),
    );
  }
}
