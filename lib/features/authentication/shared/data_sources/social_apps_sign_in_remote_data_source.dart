import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';

abstract interface class SocialAppsSignInRemoteDataSourceInterface {
  Future<FirebaseAuthResponse> googleSignIn();
}

final class SocialAppsSignInRemoteDataSourceImpl
    implements SocialAppsSignInRemoteDataSourceInterface {
  @override
  Future<FirebaseAuthResponse> googleSignIn() async {
    try {
      UserCredential credential = await Authentication.signInWithGoogle();
      return SuccessFirebaseAuthResponse(credential);
    } catch (e) {
      FirebaseAuthFailure authFailure = FirebaseAuthFailure(e.toString());
      throw FailureFirebaseAuthResponse(authFailure);
    }
  }
}
