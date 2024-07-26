import 'package:equatable/equatable.dart';

final class MoviesParameters extends Equatable {
  final int? pageNum, movieId;
  final String endPoint;

  const MoviesParameters(
      {required this.pageNum, required this.movieId, required this.endPoint});

  @override
  List<Object?> get props => [pageNum, endPoint, movieId];
}
