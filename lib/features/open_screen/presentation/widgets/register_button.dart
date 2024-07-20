part of 'login_register_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AppNavigator.navigateToRegisterScreen(context);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(AppSizes.paddingSizeDefault))),
      child: HeroTextAnimation(
        tag: AppTags.registerTextTag,
        child: Text(
            AppLocalizations.of(context).translate(AppStrings.register)),
      ),
    );
  }
}
