part of 'login_register_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key('Elevated Button $key'),
      onPressed: () {
        AppNavigator.navigateToRegisterScreen(context);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppSizes.paddingSizeDefault))),
      child: HeroAnimation(
        key: Key('Hero $key'),
        tag: AppTags.registerTextTag,
        child: Text(
            key: Key('Text $key'),
            AppLocalizations.of(context).translate(AppStrings.register)),
      ),
    );
  }
}
