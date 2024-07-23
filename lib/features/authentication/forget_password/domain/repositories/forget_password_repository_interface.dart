import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class ForgetPasswordRepositoryInterface<T> {
  Future<DataResponse> resetPassword(T parameters);
}
