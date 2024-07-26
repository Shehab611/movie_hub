part of 'app_router.dart';

abstract final class AppNavigator {
  static navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kLoginScreen);
  }

  static navigateToOpenScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppPathName.kOpenScreen, ModalRoute.withName('/'));
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
    Navigator.pushNamedAndRemoveUntil(
        context, AppPathName.kHomeScreen, ModalRoute.withName('/'));
  }

  static navigateToDetailsScreen(BuildContext context, [Object? arg]) {
    Navigator.pushNamed(context, AppPathName.kDetailsScreen, arguments: arg);
  }

  static navigateToSeeMoreScreen(BuildContext context, [Object? arg]) {
    Navigator.pushNamed(context, AppPathName.kSeeMoreScreen, arguments: arg);
  }

  static navigateToScreen(BuildContext context, String routePath,
      [Object? arg]) {
    if (routePath == AppPathName.kHomeScreen ||
        routePath == AppPathName.kOpenScreen) {
      Navigator.pushNamedAndRemoveUntil(
          context, routePath, ModalRoute.withName('/'));
    } else {
      Navigator.pushNamed(context, routePath, arguments: arg);
    }
  }
}
