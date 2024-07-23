import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class EmailVerificationRepositoryInterface<
    T extends Parameters> {
  Future<DataResponse> sendEmailVerification(T parameters);
}
