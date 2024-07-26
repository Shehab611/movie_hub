import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class MovieRepositoryInterface<T> {
  Future<DataResponse> getMovies(T parameters);

  Future<DataResponse> getMovieDetails(T parameters);
}
