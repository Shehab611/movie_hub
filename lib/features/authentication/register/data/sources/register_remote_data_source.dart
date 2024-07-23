import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';

abstract interface class RegisterRemoteDataSourceInterface {
  Future<FirebaseAuthResponse> userRegister(RegisterParameters parameters);
}

final class RegisterRemoteDataSourceImpl
    implements RegisterRemoteDataSourceInterface {
  @override
  Future<FirebaseAuthResponse> userRegister(
      RegisterParameters parameters) async {
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
