import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/hero_text_animation.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';

part 'login_button.dart';

part 'register_button.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.centerRight,
      children: [LoginButton(), RegisterButton()],
    );
  }
}
