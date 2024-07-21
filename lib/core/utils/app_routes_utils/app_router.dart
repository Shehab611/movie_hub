import 'package:flutter/material.dart';
import 'package:movie_hub/features/authentication/login/presentation/views/login_screen.dart';
import 'package:movie_hub/features/authentication//register/presentation/views/register_screen.dart';
import 'package:movie_hub/features/open_screen/presentation/view/open_screen.dart';

part 'app_navigator.dart';

part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kOpenScreen: (BuildContext context) => const OpenScreen(),
    AppPathName.kLoginScreen: (BuildContext context) => const LoginScreen(),
    AppPathName.kRegisterScreen: (BuildContext context) =>
        const RegisterScreen(),
  };
}
