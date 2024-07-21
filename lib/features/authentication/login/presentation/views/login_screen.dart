import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeroTextAnimation(
          tag: AppTags.loginTextTag,
          child: Text(AppLocalizations.of(context).translate(AppStrings.login)),
        ),
      ),
    );
  }
}
