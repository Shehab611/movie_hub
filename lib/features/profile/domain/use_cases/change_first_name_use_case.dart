part of 'main_use_case.dart';

final class ChangeFirstNameUseCase implements BaseUseCaseInterface<String> {
  final ProfileRepositoryInterface<String> _repositoryInterface;

  ChangeFirstNameUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(String p) async {
    return await _repositoryInterface.changeFirstName(p);
  }
}
