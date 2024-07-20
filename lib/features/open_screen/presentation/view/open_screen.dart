import 'package:flutter/material.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/design_utils/app_images.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/open_screen/presentation/widgets/login_register_button.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.logo,
            color: sl<AppTheme>().themeMode == ThemeMode.dark ? Colors.white : null,
          ),
          const LoginRegisterButton()
        ],
      ),
    );
  }
}
