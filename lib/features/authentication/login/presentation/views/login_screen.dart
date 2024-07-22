import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/usable_functions/validate_check.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_images.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';

part '../components/login_buttons.dart';
part '../components/login_text_fields.dart';
part '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Scaffold Semantics  $key'),
      label:AppLocalizations.of(context)
          .translate(AppStrings.openScreenScaffoldSemanticLabel) ,
      child: Scaffold(
        key: Key('Scaffold $key'),
        appBar: AppBar(
          key: Key('AppBar $key'),
          title: HeroAnimation(
            key:  Key("Hero Login Text $key"),
            tag: AppTags.loginTextTag,
            child: Text(AppLocalizations.of(context).translate(AppStrings.login)),
          ),
        ),
        body:  CustomScrollView(
          key: Key("Custom Scroll View login $key"),
          slivers: [
            SliverPadding(
              key: Key("Sliver Padding login $key"),
              padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
              sliver: SliverFillRemaining(
                key: Key("Sliver fill reaming login $key"),
                hasScrollBody: false,
                child: LoginBody(
                  key: Key("Login body $key"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
