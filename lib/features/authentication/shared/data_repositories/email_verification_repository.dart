import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/shared/data_sources/email_verification_remote_data_source.dart';
import 'package:movie_hub/features/authentication/shared/domain_repositories/email_verification_interface.dart';

final class EmailVerificationRepository
    implements EmailVerificationRepositoryInterface<User> {
  final EmailVerificationRemoteDataSourceInterface _dataSource;

  const EmailVerificationRepository(this._dataSource);

  @override
  Future<DataResponse> sendEmailVerification(User user) async {
    await _dataSource.sendEmailVerification(user);
    return const SuccessDataResponse(true);
  }
}
