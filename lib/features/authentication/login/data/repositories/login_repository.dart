import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/login/data/sources/login_remote_data_source.dart';
import 'package:movie_hub/features/authentication/login/domain/repositories/login_repository_interface.dart';
import 'package:movie_hub/features/authentication/login/parameters/login_parameters.dart';

final class LoginRepository
    implements LoginRepositoryInterface<LoginParameters> {
  final LoginRemoteDataSource _dataSource;

  const LoginRepository(this._dataSource);

  @override
  Future<DataResponse> userLogin(LoginParameters parameters) async {
    try {
      final FirebaseAuthResponse data = await _dataSource.userLogin(parameters);
      return SuccessDataResponse<SuccessFirebaseAuthResponse>(
          data as SuccessFirebaseAuthResponse);
    } on FailureFirebaseAuthResponse catch (e) {
      return FailureDataResponse<FailureFirebaseAuthResponse>(e);
    }
  }
}
