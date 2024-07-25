import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';

abstract interface class ProfileRemoteDataSourceInterface {
  Future<String?> changeFirstName(String firstName);

  Future<String?> changeLastName(String lastName);

  Future<String?> changeEmail(String email);

  Future<String?> changePassword(String password);

}

final class ProfileRemoteDataSourceImpl
    implements ProfileRemoteDataSourceInterface {
  @override
  Future<String?> changeEmail(String email) async {
    try {
      await Authentication.changeEmail(email);
      return null;
    } on FirebaseAuthException catch (e) {
      FirebaseAuthFailure authFailure =
          FirebaseAuthFailure.fromAuthException(e);
      throw FailureFirebaseAuthResponse(authFailure);
    }
  }

  @override
  Future<String?> changeFirstName(String firstName) async {
    try {
      await Authentication.changeFirstName(firstName);
      return null;
    } on FirebaseAuthException catch (e) {
      FirebaseAuthFailure authFailure =
          FirebaseAuthFailure.fromAuthException(e);
      throw FailureFirebaseAuthResponse(authFailure);
    }
  }

  @override
  Future<String?> changeLastName(String lastName) async {
    try {
      await Authentication.changeLastName(lastName);
      return null;
    } on FirebaseAuthException catch (e) {
      FirebaseAuthFailure authFailure =
          FirebaseAuthFailure.fromAuthException(e);
      throw FailureFirebaseAuthResponse(authFailure);
    }
  }

  @override
  Future<String?> changePassword(String password) async {
    try {
      await Authentication.changePassword(password);
      return null;
    } on FirebaseAuthException catch (e) {
      FirebaseAuthFailure authFailure =
          FirebaseAuthFailure.fromAuthException(e);
      throw FailureFirebaseAuthResponse(authFailure);
    }
  }

}
