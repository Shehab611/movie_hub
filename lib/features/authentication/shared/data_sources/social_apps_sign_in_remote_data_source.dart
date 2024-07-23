import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';

abstract interface class SocialAppsSignInRemoteDataSource {
  Future<FirebaseAuthResponse> googleSignIn();
}

final class SocialAppsSignInRemoteDataSourceImpl
    implements SocialAppsSignInRemoteDataSource {
  @override
  Future<FirebaseAuthResponse> googleSignIn() async {
    try {
      UserCredential credential = await Authentication.signInWithGoogle();
      return SuccessFirebaseAuthResponse(credential);
    } catch (e) {
      FirebaseAuthFailure authFailure = FirebaseAuthFailure(e.toString());
      return FailureFirebaseAuthResponse(authFailure);
    }
  }
}
