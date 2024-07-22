import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_images.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/authentication/shared/components/shared_components.dart';

part '../widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Forget Password Scaffold Semantics $key'),
      label: AppLocalizations.of(context)
          .translate(AppStrings.forgetPasswordScaffoldSemanticLabel),
      child: Scaffold(
        key: Key('Forget Password Scaffold $key'),
        body: CustomScrollView(
          key: Key("Custom Scroll View Forget Password $key"),
          slivers: [
            SliverPadding(
              key: Key("Sliver Padding Forget Password $key"),
              padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
              sliver: SliverFillRemaining(
                key: Key("Sliver fill reaming Forget Password $key"),
                hasScrollBody: false,
                child: ForgetPasswordBody(
                  key: Key("Forget Password body $key"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
