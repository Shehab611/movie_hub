part of 'shared_components.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, this.isLogin = true, this.onPressed});

  final bool isLogin;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('Google Row $key'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context).translate(isLogin
            ? AppStrings.loginWithEmailOr
            : AppStrings.signUpWithEmailOr)),
        IconButton(
            key: Key('Icon Button $key'),
            tooltip: AppLocalizations.of(context)
                .translate(AppStrings.googleButtonSemanticLabel),
            onPressed: onPressed,
            icon: Icon(
              FontAwesomeIcons.google,
              color: Theme.of(context).colorScheme.surfaceTint,
            )),
      ],
    );
  }
}
