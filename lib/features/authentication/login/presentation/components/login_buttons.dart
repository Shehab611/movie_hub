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
      child: ElevatedButton(
        key: Key('Elevated Button $key'),
        onPressed: onPressed,
        child: Text(
          key: Key('Text $key'),
          AppLocalizations.of(context).translate(AppStrings.login),
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
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: AppLocalizations.of(context).translate(AppStrings.register),
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
