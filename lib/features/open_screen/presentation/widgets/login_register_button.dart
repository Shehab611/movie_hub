import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';

part 'login_button.dart';
part 'register_button.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: Key('Stack $key'),
      alignment: Alignment.centerRight,
      children: [
        LoginButton(
          key: Key('Login Button $key'),
        ),
        RegisterButton(
          key: Key('Register Button $key'),
        )
      ],
    );
  }
}
