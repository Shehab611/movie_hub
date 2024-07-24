part of 'firebase_handling.dart';

abstract final class Authentication {
  static Future<UserCredential> createUserWithEmailAndPassword(
          {required String email, required String password}) async =>
      await sl
          .get<FirebaseAuth>().createUserWithEmailAndPassword(
          email: email.toLowerCase(), password: password);

  static Future<UserCredential> signInWithEmailAndPassword(
          {required String email, required String password}) async =>
      await sl
          .get<FirebaseAuth>().signInWithEmailAndPassword(
          email: email.toLowerCase(), password: password);

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return await sl.get<FirebaseAuth>().signInWithCredential(credential);
  }

  static Future<void> resetPassword({required String email}) async => await sl
      .get<FirebaseAuth>()
      .sendPasswordResetEmail(email: email.toLowerCase());

  static Future<void> sendEmailVerification({required User user}) =>
      user.sendEmailVerification();

  static Future<void> changePassword(String password) async =>
      await sl.get<FirebaseAuth>().currentUser!.updatePassword(password);

  static Future<void> logOut() async {
    await sl.get<FirebaseAuth>().signOut();
    if (GoogleSignIn().currentUser != null) {
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
    }
  }

  static Future<void> deleteAccount() async =>
      await sl.get<FirebaseAuth>().currentUser!.delete();
}

sealed class FirebaseAuthResponse {
  const FirebaseAuthResponse();
}

final class FailureFirebaseAuthResponse extends FirebaseAuthResponse {
  final FirebaseAuthFailure error;

  const FailureFirebaseAuthResponse(this.error);
}

final class SuccessFirebaseAuthResponse extends FirebaseAuthResponse {
  final UserCredential userCredential;

  const SuccessFirebaseAuthResponse(this.userCredential);
}
