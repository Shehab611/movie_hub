part of 'login_register_button.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.053,
      width: size.width * 0.56,
      decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppSizes.paddingSizeDefault)),
      child: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {
                AppNavigator.navigateToLoginScreen(context);
              },
              child: HeroTextAnimation(
                tag: AppTags.loginTextTag,
                child: Text(
                    AppLocalizations.of(context).translate(AppStrings.login)),
              ))),
    );
  }
}
