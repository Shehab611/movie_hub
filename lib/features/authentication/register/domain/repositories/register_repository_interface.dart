import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class RegisterRepositoryInterface<T> {
  Future<DataResponse> userRegister(T parameters);
}
