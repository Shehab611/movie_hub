import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {required this.imagePath,
      this.clipBehavior = Clip.antiAlias,
      this.width,
      this.height,
      this.onImageLoading,
      this.onImageError,
      this.fit = BoxFit.cover,
      this.borderRadius,
      super.key});

  final String imagePath;
  final double? width, height;
  final Widget Function(BuildContext, String)? onImageLoading;
  final Widget Function(BuildContext, String, Object)? onImageError;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius ?? BorderRadius.circular(AppSizes.paddingSizeDefault),
      clipBehavior: clipBehavior,
      child: CachedNetworkImage(
        imageUrl: imagePath,
        width: width,
        height: height,
        fit: fit,
        placeholder: onImageLoading ??
            (context, url) => CustomShimmer(
                    child: SizedBox(
                  width: width,
                  height: height,
                )),
        errorWidget:
            onImageError ?? (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
