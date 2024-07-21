import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer(
      {super.key,
      required this.child,
      this.applyShimmer = true,
      this.baseColor,
      this.highlightColor});

  final bool applyShimmer;
  final Widget child;
  final Color? baseColor, highlightColor;

  @override
  Widget build(BuildContext context) {
    return applyShimmer
        ? Shimmer.fromColors(
            baseColor:
                baseColor ?? Theme.of(context).colorScheme.inversePrimary,
            highlightColor:
                highlightColor ?? Theme.of(context).colorScheme.onPrimaryFixed,
            child: child)
        : child;
  }
}
