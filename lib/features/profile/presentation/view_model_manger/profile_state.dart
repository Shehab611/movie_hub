part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial();

  @override
  List<Object> get props => [];
}

final class ProfileChangeFirstnameVariables extends ProfileState {
  const ProfileChangeFirstnameVariables();

  @override
  List<Object> get props => [];
}

final class ProfileChangeLastNameVariables extends ProfileState {
  const ProfileChangeLastNameVariables();

  @override
  List<Object> get props => [];
}

final class ProfileChangeEmailVariables extends ProfileState {
  const ProfileChangeEmailVariables();

  @override
  List<Object> get props => [];
}

final class ProfileUpdateUserDataLoadingState extends ProfileState {
  const ProfileUpdateUserDataLoadingState();

  @override
  List<Object> get props => [];
}

final class ProfileUpdateUserDataSuccessfulState extends ProfileState {
  const ProfileUpdateUserDataSuccessfulState();

  @override
  List<Object> get props => [];
}

final class ProfileUpdateUserDataFailedState extends ProfileState {
  const ProfileUpdateUserDataFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}
