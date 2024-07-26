part of 'home_cubit.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();
}

final class NowPlayingInitial extends NowPlayingState {
  const NowPlayingInitial();

  @override
  List<Object> get props => [];
}

final class NowPlayingLoadingState extends NowPlayingState {
  const NowPlayingLoadingState();

  @override
  List<Object> get props => [];
}

final class NowPlayingFailedState extends NowPlayingState {
  const NowPlayingFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

final class NowPlayingSuccessState extends NowPlayingState {
  const NowPlayingSuccessState();

  @override
  List<Object> get props => [];
}
