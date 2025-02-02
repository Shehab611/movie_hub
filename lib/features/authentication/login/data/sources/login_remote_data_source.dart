import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/features/authentication/login/parameters/login_parameters.dart';

abstract interface class LoginRemoteDataSourceInterface {
  Future<FirebaseAuthResponse> userLogin(LoginParameters parameters);
}

final class LoginRemoteDataSourceImpl
    implements LoginRemoteDataSourceInterface {
  @override
  Future<FirebaseAuthResponse> userLogin(LoginParameters parameters) async {
    try {
      UserCredential credential =
          await Authentication.signInWithEmailAndPassword(
              email: parameters.email, password: parameters.password);
      return SuccessFirebaseAuthResponse(credential);
    } on FirebaseAuthException catch (e) {
      FirebaseAuthFailure authFailure =
          FirebaseAuthFailure.fromAuthException(e);
      throw FailureFirebaseAuthResponse(authFailure);
    }
  }
}
