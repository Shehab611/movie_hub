part of 'home_cubit.dart';

sealed class SimilarState extends Equatable {
  const SimilarState();
}

final class SimilarInitial extends SimilarState {
  const SimilarInitial();

  @override
  List<Object> get props => [];
}

final class SimilarLoadingState extends SimilarState {
  const SimilarLoadingState();

  @override
  List<Object> get props => [];
}

final class SimilarFailedState extends SimilarState {
  const SimilarFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

final class SimilarSuccessState extends SimilarState {
  const SimilarSuccessState();

  @override
  List<Object> get props => [];
}
