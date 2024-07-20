import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: size.height * 0.05,
          width: size.width * 0.56,
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSizes.paddingSizeDefault)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {
                    AppNavigator.navigateToLoginScreen(context);
                  },
                  child: Text(
                    AppLocalizations.of(context).translate(AppStrings.login),
                  ))),
        ),
        ElevatedButton(
          onPressed: () {
            AppNavigator.navigateToRegisterScreen(context);
          },
          style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.paddingSizeDefault))),
          child:
              Text(AppLocalizations.of(context).translate(AppStrings.register)),
        )
      ],
    );
  }
}
