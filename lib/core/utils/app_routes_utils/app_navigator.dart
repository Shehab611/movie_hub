part of 'app_router.dart';

abstract final class AppNavigator {
  static navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kLoginScreen);
  }

  static navigateToRegisterScreen(BuildContext context) {
    Navigator.pushNamed(context, AppPathName.kRegisterScreen);
  }
}
