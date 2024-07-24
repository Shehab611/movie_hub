import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/core/shared/domain_repositories/logout_repository_interface.dart';

final class LogoutUseCase implements BaseUseCaseInterface<NoParameters> {
  final LogoutRepositoryInterface _repositoryInterface;

  LogoutUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(NoParameters p) async {
    return await _repositoryInterface.logOut();
  }
}
