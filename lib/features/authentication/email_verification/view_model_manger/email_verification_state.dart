part of 'email_verification_cubit.dart';

sealed class EmailVerificationState extends Equatable {
  const EmailVerificationState();
}

final class EmailVerificationInitial extends EmailVerificationState {
  const EmailVerificationInitial();

  @override
  List<Object> get props => [];
}

final class EmailSendSuccessfullyState extends EmailVerificationState {
  const EmailSendSuccessfullyState();

  @override
  List<Object> get props => [];
}

final class EmailVerifiedSuccessfullyState extends EmailVerificationState {
  const EmailVerifiedSuccessfullyState();

  @override
  List<Object> get props => [];
}
