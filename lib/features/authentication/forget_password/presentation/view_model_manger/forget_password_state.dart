part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
}

final class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordSendMailState extends ForgetPasswordState {
  const ForgetPasswordSendMailState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordLoadingState extends ForgetPasswordState {
  const ForgetPasswordLoadingState();

  @override
  List<Object> get props => [];
}
