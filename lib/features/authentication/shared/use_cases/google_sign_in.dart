import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/shared/domain_repositories/social_apps_sign_in_interface.dart';

final class GoogleSignInUseCase implements BaseUseCaseInterface<NoParameters> {
  final SocialAppsSignInRepositoryInterface _repositoryInterface;

  GoogleSignInUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(NoParameters parameters) async {
    return await _repositoryInterface.googleSignIn();
  }
}
