part of 'shared_components.dart';

class BigActionButton extends StatelessWidget {
  const BigActionButton({super.key, this.onPressed, this.isLogin = true});

  final void Function()? onPressed;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      key: Key('Custom Shimmer $key'),
      applyShimmer: true,
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
            AppLocalizations.of(context)
                .translate(isLogin ? AppStrings.login : AppStrings.register),
          ),
        ),
      ),
    );
  }
}
