import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class BaseUseCaseInterface<T extends Parameters> {
  Future<DataResponse> call(T parameters);
}
