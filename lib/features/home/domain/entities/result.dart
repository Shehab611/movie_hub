import 'package:equatable/equatable.dart';

import 'movie.dart';

abstract class Result extends Equatable {
  final num page, totalPages, totalResults;
  final List<Movie> movies;

  const Result(
      {required this.page,
      required this.totalPages,
      required this.movies,
      required this.totalResults});

  @override
  List<Object> get props => [page, totalPages, totalResults, movies];
}
