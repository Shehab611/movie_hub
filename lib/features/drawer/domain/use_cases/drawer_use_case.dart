import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/drawer/domain/repositories/drawer_repository_interface.dart';

final class DrawerUseCase implements BaseUseCaseInterface<NoParameters> {
  final DrawerRepositoryInterface _repositoryInterface;

  DrawerUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(NoParameters p) async {
    return await _repositoryInterface.logOut();
  }
}
