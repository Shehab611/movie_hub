import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';

abstract interface class EmailVerificationRemoteDataSourceInterface {
  Future<void> sendEmailVerification(User parameters);
}

final class EmailVerificationRemoteDataSourceImpl
    implements EmailVerificationRemoteDataSourceInterface {
  @override
  Future<void> sendEmailVerification(User user) async {
    await Authentication.sendEmailVerification(user: user);
  }
}
