import 'package:movie_hub/core/usable_functions/api/api_service_helper.dart';
import 'package:movie_hub/features/home/data/models/movie_model.dart';
import 'package:movie_hub/features/home/data/models/result_model.dart';
import 'package:movie_hub/features/home/parameters/movie_parameters.dart';

abstract interface class MovieRemoteDataSourceInterface {
  Future<ResultModel> getMovies(MovieParameters parameters);

  Future<MovieModel> getMovieDetails(MovieParameters parameters);
}

final class MovieRemoteDataSourceImpl
    implements MovieRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const MovieRemoteDataSourceImpl(this._apiResponseHandler);

  @override
  Future<ResultModel> getMovies(MovieParameters parameters) async {
    ApiResponse apiResponse = await _apiResponseHandler.handleGetApiResponse(
        parameters.endPoint,
        {'page': parameters.pageNum, 'language': parameters.languageCode});

    if (apiResponse.statusCode == 200) {
      return ResultModel.fromJson(apiResponse.response!.data);
    } else {
      throw Exception(apiResponse.error);
    }
  }

  @override
  Future<MovieModel> getMovieDetails(MovieParameters parameters) async {
    ApiResponse apiResponse = await _apiResponseHandler.handleGetApiResponse(
        parameters.endPoint, {'language': parameters.languageCode});

    if (apiResponse.statusCode == 200) {
      return MovieModel.fromJson(apiResponse.response!.data);
    } else {
      throw Exception(apiResponse.error);
    }
  }
}
