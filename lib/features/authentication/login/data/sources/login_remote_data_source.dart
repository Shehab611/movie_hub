import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/features/authentication/login/parameters/login_parameters.dart';

abstract interface class LoginRemoteDataSource {
  Future<FirebaseAuthResponse> userLogin(LoginParameters parameters);
}

final class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<FirebaseAuthResponse> userLogin(LoginParameters parameters) async {
    try {
      UserCredential credential =
          await Authentication.signInWithEmailAndPassword(
              email: parameters.email, password: parameters.password);
      return SuccessFirebaseAuthResponse(credential);
    } catch (e) {
      FirebaseAuthFailure authFailure = FirebaseAuthFailure(e.toString());
      return FailureFirebaseAuthResponse(authFailure);
    }
  }
}
