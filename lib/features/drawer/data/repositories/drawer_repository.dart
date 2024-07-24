import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/drawer/data/sources/drawer_remote_data_source.dart';
import 'package:movie_hub/features/drawer/domain/repositories/drawer_repository_interface.dart';

final class DrawerRepository implements DrawerRepositoryInterface {
  final DrawerRemoteDataSourceInterface _dataSource;

  const DrawerRepository(this._dataSource);

  @override
  Future<DataResponse> logOut() async {
    await _dataSource.logOut();
    return const SuccessDataResponse(true);
  }
}
