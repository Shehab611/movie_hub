import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/profile/domain/repositories/profile_repository_interface.dart';

final class DeleteAccountUseCase implements BaseUseCaseInterface<NoParameters> {
  final ProfileRepositoryInterface _repositoryInterface;

  DeleteAccountUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(NoParameters p) async {
    return await _repositoryInterface.deleteAccount();
  }
}
