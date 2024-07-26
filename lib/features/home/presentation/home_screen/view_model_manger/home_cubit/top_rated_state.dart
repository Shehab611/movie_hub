part of 'home_cubit.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();
}

final class TopRatedInitial extends TopRatedState {
  const TopRatedInitial();

  @override
  List<Object> get props => [];
}

final class TopRatedLoadingState extends TopRatedState {
  const TopRatedLoadingState();

  @override
  List<Object> get props => [];
}

final class TopRatedFailedState extends TopRatedState {
  const TopRatedFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

final class TopRatedSuccessState extends TopRatedState {
  const TopRatedSuccessState();

  @override
  List<Object> get props => [];
}
