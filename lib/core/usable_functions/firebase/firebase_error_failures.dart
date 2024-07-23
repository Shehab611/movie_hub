part of 'firebase_handling.dart';

final class FirebaseAuthFailure {
  final String errorMessage;

  const FirebaseAuthFailure(this.errorMessage);

  factory FirebaseAuthFailure.fromAuthException(
      FirebaseAuthException exception) {
    String errorMessage = '';
    switch (exception.code) {
      case 'invalid-email':
        errorMessage = AppStrings.invalidEmailCode;
        break;
      case 'user-disabled':
        errorMessage = AppStrings.userDisabledCode;
        break;
      case 'email-already-in-use':
        errorMessage = AppStrings.emailInUseCode;
        break;
      case 'user-not-found':
        errorMessage = AppStrings.userNotFoundCode;
        break;
      case 'wrong-password':
        errorMessage = AppStrings.wrongPasswordCode;
        break;
      case 'account-exists-with-different-credential':
        errorMessage = AppStrings.invalidEmailCode;
        break;
      case 'invalid-credential':
        errorMessage = AppStrings.invalidCredentialCode;
        break;
      case 'credential-already-in-use':
        errorMessage = AppStrings.credentialInUseCode;
        break;
      default:
        errorMessage = AppStrings.unknownError;
        break;
    }
    return FirebaseAuthFailure(errorMessage);
  }
}
