import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class EmailVerificationRemoteDataSourceInterface {
  Future<DataResponse> sendEmailVerification(User parameters);
}

final class EmailVerificationRemoteDataSourceImpl
    implements EmailVerificationRemoteDataSourceInterface {
  @override
  Future<DataResponse> sendEmailVerification(User user) async {
    await Authentication.sendEmailVerification(user: user);
    return const SuccessDataResponse(true);
  }
}
