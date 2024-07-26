import 'package:equatable/equatable.dart';

abstract class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}
