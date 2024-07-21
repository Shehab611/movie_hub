part of 'custom_components.dart';

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
            key: key,
            baseColor:
                baseColor ?? Theme.of(context).colorScheme.inversePrimary,
            highlightColor:
                highlightColor ?? Theme.of(context).colorScheme.onPrimaryFixed,
            child: child)
        : child;
  }
}
