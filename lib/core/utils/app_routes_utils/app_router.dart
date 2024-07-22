import 'package:flutter/material.dart';
import 'package:movie_hub/features/authentication//register/presentation/view/register_screen.dart';
import 'package:movie_hub/features/authentication/email_verification/presentation/view/email_verification_screen.dart';
import 'package:movie_hub/features/authentication/forget_password/view/forget_password_screen.dart';
import 'package:movie_hub/features/authentication/login/presentation/view/login_screen.dart';
import 'package:movie_hub/features/open_screen/presentation/view/open_screen.dart';

part 'app_navigator.dart';
part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kOpenScreen: (BuildContext context) =>
        const OpenScreen(key: Key('Open Screen')),
    AppPathName.kLoginScreen: (BuildContext context) => const LoginScreen(
          key: Key('Login Screen'),
        ),
    AppPathName.kRegisterScreen: (BuildContext context) =>
        const RegisterScreen(key: Key('Register Screen')),
    AppPathName.kForgetPasswordScreen: (BuildContext context) =>
        const ForgetPasswordScreen(key: Key('ForgetPassword Screen')),
    AppPathName.kEmailVerificationScreen: (BuildContext context) =>
        const EmailVerificationScreen(
            key: Key('EmailVerificationScreen Screen')),
  };
}
