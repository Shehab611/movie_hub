import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/register/domain/repositories/register_repository_interface.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';

final class RegisterUseCase
    implements BaseUseCaseInterface<RegisterParameters> {
  final RegisterRepositoryInterface _repositoryInterface;

  RegisterUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(RegisterParameters p) async {
    return await _repositoryInterface.userRegister(p);
  }
}
