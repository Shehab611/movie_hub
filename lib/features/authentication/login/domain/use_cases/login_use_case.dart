import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/login/domain/repositories/login_repository_interface.dart';

final class LoginUseCase implements BaseUseCaseInterface<Parameters> {
  final LoginRepositoryInterface _repositoryInterface;

  LoginUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(Parameters p) async {
    return await _repositoryInterface.userLogin(p);
  }
}
