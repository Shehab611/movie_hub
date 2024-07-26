part of 'home_cubit.dart';

sealed class SeeMoreState extends Equatable {
  const SeeMoreState();
}

final class SeeMoreInitial extends SeeMoreState {
  const SeeMoreInitial();

  @override
  List<Object> get props => [];
}

final class SeeMoreLoadingState extends SeeMoreState {
  const SeeMoreLoadingState();

  @override
  List<Object> get props => [];
}

final class SeeMoreFailedState extends SeeMoreState {
  const SeeMoreFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

final class SeeMoreSuccessState extends SeeMoreState {
  const SeeMoreSuccessState();

  @override
  List<Object> get props => [];
}
