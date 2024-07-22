part of '../views/login_screen.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      key: Key('Align $key'),
      alignment: Alignment.centerRight,
      child: TextButton(
        key: Key('Text Button $key'),
        onPressed: () {},
        child: Text(
          key: Key('Text $key'),
          AppLocalizations.of(context).translate(AppStrings.forgetPassword),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});

  final void Function()? onPressed;

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
            AppLocalizations.of(context).translate(AppStrings.login),
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: Key('Rich Text $key'),
      text: TextSpan(
        text: AppLocalizations.of(context).translate(AppStrings.noAccount),
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),
        children: [
          TextSpan(
            text: AppLocalizations.of(context).translate(AppStrings.register),
            style: TextStyle(
              color: Theme.of(context).colorScheme.surfaceTint,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.navigateToRegisterScreen(context);
              },
          ),
        ],
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('Google Login Row $key'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)
            .translate(AppStrings.loginWithEmailOr)),
        IconButton(
            key: Key('Icon Button $key'),
            tooltip: AppLocalizations.of(context)
                .translate(AppStrings.googleButtonSemanticLabel),
            onPressed: () {},
            icon:  Icon(FontAwesomeIcons.google,color:Theme.of(context).colorScheme.surfaceTint ,)),
      ],
    );
  }
}
