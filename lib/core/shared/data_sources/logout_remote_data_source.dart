import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';

abstract interface class LogoutRemoteDataSourceInterface {
  Future<void> logOut();
}

final class LogoutRemoteDataSourceImpl
    implements LogoutRemoteDataSourceInterface {
  @override
  Future<void> logOut() async {
    await Authentication.logOut();
  }
}
