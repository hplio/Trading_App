import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trading_app/constants/colors.dart';

class KShimmerEffect extends StatelessWidget {
  const KShimmerEffect({
    super.key,
    required this.hight,
    required this.width,
    this.color,
    this.radius = 15,
  });

  final double hight;
  final double width;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
            color: color ?? (dark ? TColor.darkerGrey : TColor.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ));
  }
}
