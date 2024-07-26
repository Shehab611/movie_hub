import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/home/shared/domain/repository/movie_repository_interface.dart';
import 'package:movie_hub/features/home/shared/parameters/movies_parameters.dart';

final class GetMoviesUseCase implements BaseUseCaseInterface<MoviesParameters> {
  final MovieRepositoryInterface<MoviesParameters> _interface;

  const GetMoviesUseCase(this._interface);

  @override
  Future<DataResponse> call(MoviesParameters parameters) async {
    return await _interface.getMovies(parameters);
  }
}
