import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/usable_functions/validate_check.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/authentication/shared/components/shared_components.dart';

part '../components/register_text_fields.dart';
part '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Register Scaffold Semantics $key'),
      label: AppLocalizations.of(context)
          .translate(AppStrings.openScreenScaffoldSemanticLabel),
      child: Scaffold(
        key: Key('Register Scaffold $key'),
        appBar: AppBar(
          key: Key('Register AppBar $key'),
          title: HeroAnimation(
            key: Key("Hero Register Text $key"),
            tag: AppTags.registerTextTag,
            child: Text(
                AppLocalizations.of(context).translate(AppStrings.register)),
          ),
        ),
        body: CustomScrollView(
          key: Key("Custom Scroll View register $key"),
          slivers: [
            SliverPadding(
              key: Key("Sliver Padding register $key"),
              padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
              sliver: SliverFillRemaining(
                key: Key("Sliver fill reaming register $key"),
                hasScrollBody: false,
                child: RegisterBody(
                  key: Key("register body $key"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
