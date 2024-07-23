part of 'app_router.dart';

abstract final class AppNavigator {
  static navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kLoginScreen);
  }

  static navigateToRegisterScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kRegisterScreen);
  }

  static navigateToForgetPasswordScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kForgetPasswordScreen);
  }

  static navigateToEmailVerificationScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context,
        AppPathName.kEmailVerificationScreen, ModalRoute.withName('/'));
  }

  static navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context,
        AppPathName.kEmailVerificationScreen, ModalRoute.withName('/'));
  }
}
