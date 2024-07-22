import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_images.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/open_screen/presentation/widgets/login_register_button.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Scaffold Semantics  $key'),
      label: AppLocalizations.of(context)
          .translate(AppStrings.openScreenScaffoldSemanticLabel),
      child: Scaffold(
        key: Key('Scaffold $key'),
        body: Column(
          key: Key('Column $key'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSlideTransition(
              key: Key('CustomSlideTransition Image $key'),
              isLeftToRight: false,
              isVertical: true,
              isTopDown: true,
              animationDuration: const Duration(seconds: 1, milliseconds: 500),
              animationDelayDuration: const Duration(milliseconds: 300),
              child: HeroAnimation(
                tag: AppTags.logoTag,
                key: Key("Hero logo $key"),
                child: Image.asset(
                  semanticLabel: AppLocalizations.of(context)
                      .translate(AppStrings.logoSemanticLabel),
                  key: Key("Image logo $Key"),
                  AppImages.logo,
                  color: sl<AppTheme>().themeMode == ThemeMode.dark
                      ? Colors.white
                      : null,
                ),
              ),
            ),
            LoginRegisterButton(
              key: Key('Login Register Button $key'),
            )
          ],
        ),
      ),
    );
  }
}
