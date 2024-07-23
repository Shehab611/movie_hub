part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState();

  @override
  List<Object> get props => [];
}

final class LoginSuccessState extends LoginState {
  const LoginSuccessState();

  @override
  List<Object> get props => [];
}

final class LoginFailedState extends LoginState {
  const LoginFailedState();

  @override
  List<Object> get props => [];
}

final class GoogleLoginSuccessState extends LoginState {
  const GoogleLoginSuccessState();

  @override
  List<Object> get props => [];
}

final class GoogleLoginFailedState extends LoginState {
  const GoogleLoginFailedState();

  @override
  List<Object> get props => [];
}
