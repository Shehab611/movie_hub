part of 'shared_components.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key, this.toLogin = true});

  final bool toLogin;

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: Key('Rich Text $key'),
      text: TextSpan(
        text: AppLocalizations.of(context)
            .translate(toLogin ? AppStrings.noAccount : AppStrings.haveAccount),
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),
        children: [
          TextSpan(
            text: AppLocalizations.of(context)
                .translate(toLogin ? AppStrings.register : AppStrings.login),
            style: TextStyle(
              color: Theme.of(context).colorScheme.surfaceTint,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                toLogin
                    ? AppNavigator.navigateToRegisterScreen(context)
                    : AppNavigator.navigateToLoginScreen(context);
              },
          ),
        ],
      ),
    );
  }
}
