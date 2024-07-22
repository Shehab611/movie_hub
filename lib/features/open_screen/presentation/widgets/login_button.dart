part of 'login_register_button.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      key: Key('Container $key'),
      height: size.height * 0.053,
      width: size.width * 0.56,
      decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppSizes.paddingSizeDefault)),
      child: Align(
          key: Key('Align $key'),
          alignment: Alignment.centerLeft,
          child: TextButton(
              key: Key('Text Button $key'),
              onPressed: () {
                AppNavigator.navigateToLoginScreen(context);
              },
              child: HeroAnimation(
                key: Key('Hero Text $key'),
                tag: AppTags.loginTextTag,
                child: Text(
                    key: Key('Text $key'),
                    AppLocalizations.of(context).translate(AppStrings.login)),
              ))),
    );
  }
}
