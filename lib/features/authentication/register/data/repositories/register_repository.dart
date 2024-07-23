import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/register/data/sources/register_remote_data_source.dart';
import 'package:movie_hub/features/authentication/register/domain/repositories/register_repository_interface.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';

final class RegisterRepository
    implements RegisterRepositoryInterface<RegisterParameters> {
  final RegisterRemoteDataSourceInterface _dataSource;

  const RegisterRepository(this._dataSource);

  @override
  Future<DataResponse> userRegister(RegisterParameters parameters) async {
    try {
      final FirebaseAuthResponse data =
          await _dataSource.userRegister(parameters);
      return SuccessDataResponse<SuccessFirebaseAuthResponse>(
          data as SuccessFirebaseAuthResponse);
    } on FailureFirebaseAuthResponse catch (e) {
      return FailureDataResponse<FailureFirebaseAuthResponse>(e);
    }
  }
}
