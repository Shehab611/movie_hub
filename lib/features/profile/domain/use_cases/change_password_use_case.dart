part of 'main_use_case.dart';

final class ChangePasswordUseCase implements BaseUseCaseInterface<String> {
  final ProfileRepositoryInterface<String> _repositoryInterface;

  ChangePasswordUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(String p) async {
    return await _repositoryInterface.changePassword(p);
  }
}
