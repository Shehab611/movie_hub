import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_constants.dart';
part 'app_localization.dart';
part 'hero_tags.dart';

abstract final class AppStrings {
  //#region Required parameters keys
  static const String requiredEmail = 'email_is_required';
  static const String requiredPassword = 'password_is_required';
  static const String requiredConfirmPassword = 'confirm_password_required';
  static const String requiredFirstName = 'first_name_required';
  static const String requiredLastName = 'last_name_required';
  static const String requiredCompanyName = 'company_name_required';
  static const String requiredPhoneNumber = 'phone_number_required';
  static const String requiredMoneyAmount = 'money_amount_required';
  static const String requiredCashAmount = 'cash_amount_required';
  static const String requiredWalletName = 'wallet_name_required';
  static const String requiredWalletNumber = 'wallet_number_required';

  //#endregion

  //#region Successful Strings
  static const String logoutSuccessful = 'logout_successful';
  static const String accountCreatedSuccess = 'account_created_success';
  static const String userDeleteSuccessfully = 'user_delete_successful';
  static const String updateUserDataSuccessful = 'update_user_data_successful';

  //#endregion

  //#region App default texts
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String logout = 'logout';
  static const String register = 'register';
  static const String email = 'email';
  static const String password = 'password';
  static const String recentPassword = 'recent_password';
  static const String newPassword = 'new_password';
  static const String confirmNewPassword = 'confirm_new_password';
  static const String forgetPassword = 'forget_password';
  static const String noAccount = 'don\'t_have_account';
  static const String haveAccount = 'have_account';
  static const String confirmPassword = 'confirm_password';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String companyName = 'company_name';
  static const String cancel = 'cancel';
  static const String continueText = 'continue';
  static const String resend = 'resend';
  static const String confirm = 'confirm';
  static const String language = 'language';
  static const String noData = 'no_data';
  static const String tryAgain = 'try_again';
  static const String seeMore = 'see_more';
  static const String sync = 'sync';
  static const String syncSuccess = 'sync_success';
  static const String syncFailed = 'sync_failed';
  static const String clear = 'clear';
  static const String from = 'from';
  static const String to = 'to';
  static const String choose = 'choose';
  static const String changePassword = 'change_password';
  static const String passwordChangedSuccessful = 'password_changed_success';
  static const String loginWithEmailOr = 'login_with_email_or';
  static const String signUpWithEmailOr = 'sign_up_with_email_or';
  static const String forgetPasswordMessage = 'forget_password_message';
  static const String emailVerificationMessage = 'email_verification_message';
  static const String emailVerification = 'email_verification';
  static const String resetPassword = 'reset_password';
  static const String mailSendSuccess = 'mail_send_success';
  static const String theme = 'theme';
  static const String deleteAccount = 'delete_account';
  static const String biometricFailed = 'biometric_failed';
  static const String sameData = 'same_data';
  static const String deleteConfirmation = 'delete_confirmation';
  static const String deleteConfirmationMessage = 'delete_confirmation_message';
  static const String popular = 'popular';
  static const String topRated = 'top_rated';
  static const String upComing = 'up_coming';
  static const String similar = 'similar';
  static const String releaseDate = 'release_date';

  //#endregion

  //#region Semantics Labels
  static const String logoSemanticLabel = 'logo_semantic_label';
  static const String openScreenScaffoldSemanticLabel =
      'open_screen_scaffold_semantic_label';
  static const String loginScaffoldSemanticLabel =
      'login_screen_scaffold_semantic_label';
  static const String forgetPasswordScaffoldSemanticLabel =
      'forget_password_screen_scaffold_semantic_label';
  static const String emailVerificationScaffoldSemanticLabel =
      'email_verification_screen_scaffold_semantic_label';
  static const String googleButtonSemanticLabel =
      'google_button_semantic_label';
  static const String forgetPasswordAnimationSemanticsLabel =
      'forget_password_animation_semantic_label';
  static const String emailVerificationAnimationSemanticsLabel =
      'email_verification_animation_semantic_label';
  static const String drawerSemanticLabel = 'drawer_semantic_label';
  static const String homeScreenSemanticLabel = 'home_screen_semantic_label';
  static const String profileScreenSemanticLabel =
      'profile_screen_semantic_label';

  //#endregion

  //#region Screens Name
  static const String homeScreen = 'home_screen';
  static const String profileScreen = 'profile_screen';

  //#endregion

  //#region Invalid strings keys
  static const String invalidEmail = 'invalid_email_address';
  static const String invalidPhoneNumber = 'invalid_phone_number';
  static const String invalidPassword = 'password_chars_is_not_valid';
  static const String invalidConfirmPassword = 'confirm_password_not_matched';

  //#endregion

  //#region Network keys
  static const String noConnection = 'no_connection';
  static const String connected = 'connected';
  static const String requestCancelled = 'request_cancelled';
  static const String connectionTimeOut = 'connection_time_out';
  static const String receiveTimeOut = 'receive_time_out';
  static const String sendTimeOut = 'send_time_out';
  static const String internetConnectionError = 'internet_connection_error';
  static const String badCertificatesError = 'bad_certificates_error';
  static const String unknownError = 'unknown_error';
  static const String unexpectedError = 'unexpected_error';
  static const String apiKey = 'api_key';

//#endregion

  //#region Firebase Auth
  static const String authenticationError = 'auth_error';

  //#region Firebase Auth Error Codes
  static const String invalidEmailCode = 'invalid-email';
  static const String emailInUseCode = 'email-already-in-use';
  static const String userDisabledCode = 'user-disabled';
  static const String userNotFoundCode = 'user-not-found';
  static const String wrongPasswordCode = 'wrong-password';
  static const String accountExistCode =
      'account-exists-with-different-credential';
  static const String invalidCredentialCode = 'invalid-credential';
  static const String credentialInUseCode = 'credential-already-in-use';

//#endregion

  //#region Firebase Auth Translated Error messages
  static const String invalidEmailError = 'invalid_email_error';
  static const String userDisabledError = 'user_disabled_error';
  static const String userNotFoundError = 'user_not_found_error';
  static const String wrongPasswordError = 'wrong_password_error';
  static const String accountExistError = 'account_exist_error';
  static const String invalidCredentialError = 'invalid_credential_error';
  static const String credentialInUseError = 'credential_in_use_error';
  static const String emailInUseError = 'email_in_use_error';
//#endregion

//#endregion
}
