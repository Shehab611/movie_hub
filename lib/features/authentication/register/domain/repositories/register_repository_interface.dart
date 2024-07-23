import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class RegisterRepositoryInterface<T extends Parameters> {
  Future<DataResponse> userRegister(T parameters);
}
