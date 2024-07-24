part of 'drawer_cubit.dart';

sealed class DrawerState extends Equatable {
  const DrawerState();
}

final class DrawerInitial extends DrawerState {
  const DrawerInitial();

  @override
  List<Object> get props => [];
}
