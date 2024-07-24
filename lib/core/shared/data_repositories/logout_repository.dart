import 'package:movie_hub/core/shared/data_sources/logout_remote_data_source.dart';
import 'package:movie_hub/core/shared/domain_repositories/logout_repository_interface.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';

final class LogoutRepository implements LogoutRepositoryInterface {
  final LogoutRemoteDataSourceInterface _dataSource;

  const LogoutRepository(this._dataSource);

  @override
  Future<DataResponse> logOut() async {
    await _dataSource.logOut();
    return const SuccessDataResponse(true);
  }
}
