import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/forget_password/domain/repositories/forget_password_repository_interface.dart';

final class ForgetPasswordUseCase implements BaseUseCaseInterface<String> {
  final ForgetPasswordRepositoryInterface _repositoryInterface;

  ForgetPasswordUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(String p) async {
    return await _repositoryInterface.resetPassword(p);
  }
}
