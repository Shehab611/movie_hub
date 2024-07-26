import 'package:equatable/equatable.dart';


abstract class Movie extends Equatable {
  final String backdropPath;
  final String title;
  final num id;
  final String originalLanguage;
  final String overview;
  final String releaseDate;
  final num voteAverage;
  final num voteCount;

  const Movie(
      {required this.backdropPath,
      required this.title,
      required this.id,
      required this.originalLanguage,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        title,
        id,
        originalLanguage,
        overview,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
