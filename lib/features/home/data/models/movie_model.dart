import 'package:movie_hub/features/home/domain/entities/movie.dart';

final class MovieModel extends Movie {
  const MovieModel({
    required super.backdropPath,
    required super.title,
    required super.id,
    required super.originalLanguage,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        backdropPath: json['backdrop_path'] ?? '',
        title: json['title'] ?? '',
        id: json['id'] ?? 0,
        originalLanguage: json['original_language'] ?? '',
        overview: json['overview'] ?? '',
        releaseDate: json['release_date'] ?? '',
        voteAverage: json['vote_average'] ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['title'] = title;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;

    return data;
  }
}
