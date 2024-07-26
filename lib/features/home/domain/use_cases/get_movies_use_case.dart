import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/home/domain/repository/movie_repository_interface.dart';
import 'package:movie_hub/features/home/parameters/movie_parameters.dart';

final class GetMoviesUseCase implements BaseUseCaseInterface<MovieParameters> {
  final MovieRepositoryInterface<MovieParameters> _interface;

  const GetMoviesUseCase(this._interface);

  @override
  Future<DataResponse> call(MovieParameters parameters) async {
    return await _interface.getMovies(parameters);
  }
}
