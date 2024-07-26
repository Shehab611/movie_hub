part of 'home_cubit.dart';

sealed class UpComingState extends Equatable {
  const UpComingState();
}

final class UpComingInitial extends UpComingState {
  const UpComingInitial();

  @override
  List<Object> get props => [];
}

final class UpComingLoadingState extends UpComingState {
  const UpComingLoadingState();

  @override
  List<Object> get props => [];
}

final class UpComingFailedState extends UpComingState {
  const UpComingFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

final class UpComingSuccessState extends UpComingState {
  const UpComingSuccessState();

  @override
  List<Object> get props => [];
}
