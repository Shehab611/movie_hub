import 'package:movie_hub/features/home/data/models/movie_model.dart';
import 'package:movie_hub/features/home/domain/entities/movie.dart';
import 'package:movie_hub/features/home/domain/entities/result.dart';

final class ResultModel extends Result {
  const ResultModel(
      {required super.page,
      required super.totalPages,
      required super.movies,
      required super.totalResults});

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
        page: json['page'],
        totalPages: json['total_pages'],
        movies: (json['results'] ?? [])
            .map<Movie>((movie) => MovieModel.fromJson(movie))
            .toList(),
        totalResults: json['total_results']);
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'total_pages': totalPages,
      'results': movies,
      'total_results': totalResults
    };
  }
}
