import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/shared/domain_repositories/email_verification_interface.dart';

final class EmailVerificationUseCase implements BaseUseCaseInterface<User> {
  final EmailVerificationRepositoryInterface _repositoryInterface;

  EmailVerificationUseCase(this._repositoryInterface);

  @override
  Future<DataResponse> call(User parameters) async {
    return await _repositoryInterface.sendEmailVerification(parameters);
  }
}
