import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/shared/data_sources/social_apps_sign_in_remote_data_source.dart';
import 'package:movie_hub/features/authentication/shared/domain_repositories/social_apps_sign_in_interface.dart';

final class SocialAppsSignInRepository
    implements SocialAppsSignInRepositoryInterface {
  final SocialAppsSignInRemoteDataSourceInterface _dataSource;

  const SocialAppsSignInRepository(this._dataSource);

  @override
  Future<DataResponse> googleSignIn() async {
    try {
      final FirebaseAuthResponse data = await _dataSource.googleSignIn();

      return SuccessDataResponse<SuccessFirebaseAuthResponse>(
          data as SuccessFirebaseAuthResponse);
    } on FailureFirebaseAuthResponse catch (e) {
      return FailureDataResponse<FailureFirebaseAuthResponse>(e);
    }
  }
}
