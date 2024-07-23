import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/shared/data_sources/email_verification_remote_data_source.dart';
import 'package:movie_hub/features/authentication/shared/domain_repositories/email_verification_interface.dart';
import 'package:movie_hub/features/authentication/shared/parameters/email_verification_parameters.dart';

final class EmailVerificationRepository
    implements
        EmailVerificationRepositoryInterface<EmailVerificationParameters> {
  final EmailVerificationRemoteDataSourceInterface _dataSource;

  const EmailVerificationRepository(this._dataSource);

  @override
  Future<DataResponse> sendEmailVerification(
      EmailVerificationParameters parameters) async {
    await _dataSource.sendEmailVerification(parameters);
    return const SuccessDataResponse(true);
  }
}
