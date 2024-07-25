part of 'main_use_case.dart';

final class ChangeLastNameUseCase implements BaseUseCaseInterface<String> {
  final ProfileRepositoryInterface<String> _repositoryInterface;

  ChangeLastNameUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(String p) async {
    return await _repositoryInterface.changeLastName(p);
  }
}
