part of 'firebase_handling.dart';

abstract final class Authentication {
  static Future<UserCredential> createUserWithEmailAndPassword(
          {required String email, required String password}) async =>
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

  static Future<UserCredential> signInWithEmailAndPassword(
          {required String email, required String password}) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<void> resetPassword({required String email}) async =>
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  static Future<void> sendEmailVerification({required User user}) =>
      user.sendEmailVerification();

  static Future<void> changePassword(String password) async =>
      await FirebaseAuth.instance.currentUser!.updatePassword(password);

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
  }

  static Future<void> deleteAccount() async =>
      await FirebaseAuth.instance.currentUser!.delete();
}

final class FirebaseAuthResponse {
  final bool success;
  final FirebaseAuthFailure? error;

  const FirebaseAuthResponse({this.success = true, this.error});

  factory FirebaseAuthResponse.withError(FirebaseAuthException exception) {
    return FirebaseAuthResponse(
        success: false,
        error: FirebaseAuthFailure.fromAuthException(exception));
  }

  factory FirebaseAuthResponse.withSuccess() {
    return const FirebaseAuthResponse();
  }
}
