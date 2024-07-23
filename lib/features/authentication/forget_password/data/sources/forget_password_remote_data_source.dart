import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';

abstract interface class ForgetPasswordRemoteDataSourceInterface {
  Future<void> resetPassword(String email);
}

final class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSourceInterface {
  @override
  Future<void> resetPassword(String email) async {
    Authentication.resetPassword(email: email);
  }
}
