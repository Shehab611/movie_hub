part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial();

  @override
  List<Object> get props => [];
}

final class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();

  @override
  List<Object> get props => [];
}

final class RegisterSuccessState extends RegisterState {
  const RegisterSuccessState();

  @override
  List<Object> get props => [];
}

final class RegisterFailedState extends RegisterState {
  const RegisterFailedState();

  @override
  List<Object> get props => [];
}

final class GoogleRegisterSuccessState extends RegisterState {
  const GoogleRegisterSuccessState();

  @override
  List<Object> get props => [];
}

final class GoogleRegisterFailedState extends RegisterState {
  const GoogleRegisterFailedState();

  @override
  List<Object> get props => [];
}
