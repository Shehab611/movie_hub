part of 'home_cubit.dart';

sealed class PopularState extends Equatable {
  const PopularState();
}

final class PopularInitial extends PopularState {
  const PopularInitial();

  @override
  List<Object> get props => [];
}

final class PopularLoadingState extends PopularState {
  const PopularLoadingState();

  @override
  List<Object> get props => [];
}

final class PopularFailedState extends PopularState {
  const PopularFailedState(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

final class PopularSuccessState extends PopularState {
  const PopularSuccessState();

  @override
  List<Object> get props => [];
}
