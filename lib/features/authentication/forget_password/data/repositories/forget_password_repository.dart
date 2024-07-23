import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/forget_password/data/sources/forget_password_remote_data_source.dart';
import 'package:movie_hub/features/authentication/forget_password/domain/repositories/forget_password_repository_interface.dart';

final class ForgetPasswordRepository
    implements ForgetPasswordRepositoryInterface<String> {
  final ForgetPasswordRemoteDataSourceInterface _dataSource;

  const ForgetPasswordRepository(this._dataSource);

  @override
  Future<DataResponse> resetPassword(String email) async {
    await _dataSource.resetPassword(email);
    return const SuccessDataResponse(true);
  }
}
