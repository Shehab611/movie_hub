import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/shared/parameters/email_verification_parameters.dart';

abstract interface class EmailVerificationRemoteDataSourceInterface {
  Future<DataResponse> sendEmailVerification(
      EmailVerificationParameters parameters);
}

final class EmailVerificationRemoteDataSourceImpl
    implements EmailVerificationRemoteDataSourceInterface {
  @override
  Future<DataResponse> sendEmailVerification(
      EmailVerificationParameters parameters) async {
    await Authentication.sendEmailVerification(user: parameters.user);
    return const SuccessDataResponse(true);
  }
}
