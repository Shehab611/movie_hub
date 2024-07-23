part of 'shared_components.dart';

class BigActionButton extends StatelessWidget {
  const BigActionButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.applyShimmer = false});

  final void Function()? onPressed;
  final String text;
  final bool applyShimmer;
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      key: Key('Custom Shimmer $key'),
      applyShimmer: applyShimmer,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.paddingSizeEight),
        child: ElevatedButton(
          key: Key('Elevated Button $key'),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 45),
          ),
          onPressed: onPressed,
          child: Text(
            key: Key('Text $key'),
            AppLocalizations.of(context).translate(text),
          ),
        ),
      ),
    );
  }
}
