import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';

part 'firebase_auth.dart';
part 'firebase_error_failures.dart';

abstract final class FirebaseResponseChecker {
  static void checkAuthResponse(
      FirebaseAuthResponse response, BuildContext context) {
    String translatedText =
        AppLocalizations.of(context).translate(AppStrings.authenticationError);
    switch (response.error!.errorMessage) {
      case AppStrings.invalidEmailCode:
        translatedText += AppLocalizations.of(context)
            .translate(AppStrings.invalidEmailError);
      case AppStrings.userDisabledCode:
        translatedText += AppLocalizations.of(context)
            .translate(AppStrings.userDisabledError);
      case AppStrings.userNotFoundCode:
        translatedText += AppLocalizations.of(context)
            .translate(AppStrings.userNotFoundError);
      case AppStrings.wrongPasswordCode:
        translatedText += AppLocalizations.of(context)
            .translate(AppStrings.wrongPasswordError);
      case AppStrings.accountExistCode:
        translatedText += AppLocalizations.of(context)
            .translate(AppStrings.accountExistError);
      case AppStrings.invalidCredentialCode:
        translatedText += AppLocalizations.of(context)
            .translate(AppStrings.invalidCredentialError);
      case AppStrings.credentialInUseCode:
        translatedText += AppLocalizations.of(context)
            .translate(AppStrings.credentialInUseError);
      case AppStrings.emailInUseCode:
        translatedText +=
            AppLocalizations.of(context).translate(AppStrings.emailInUseError);
      case AppStrings.unknownError:
        translatedText +=
            AppLocalizations.of(context).translate(AppStrings.unknownError);
    }
    showCustomSnackBar(translatedText, context);
  }
}
