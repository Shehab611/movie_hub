import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/home/data/models/movie_model.dart';
import 'package:movie_hub/features/home/data/models/result_model.dart';
import 'package:movie_hub/features/home/data/sources/movie_remote_data_source.dart';
import 'package:movie_hub/features/home/domain/repository/movie_repository_interface.dart';
import 'package:movie_hub/features/home/parameters/movie_parameters.dart';

final class MovieRepository
    implements MovieRepositoryInterface<MovieParameters> {
  final MovieRemoteDataSourceInterface _dataSource;

  const MovieRepository(this._dataSource);

  @override
  Future<DataResponse> getMovieDetails(MovieParameters parameters) async {
    try {
      final data = await _dataSource.getMovieDetails(parameters);
      return SuccessDataResponse<MovieModel>(data);
    } catch (e) {
      return FailureDataResponse<String>(e.toString());
    }
  }

  @override
  Future<DataResponse> getMovies(MovieParameters parameters) async {
    try {
      final data = await _dataSource.getMovies(parameters);
      return SuccessDataResponse<ResultModel>(data);
    } catch (e) {
      return FailureDataResponse<String>(e.toString());
    }
  }
}
