import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class ProfileRepositoryInterface<T> {
  Future<DataResponse> changeFirstName(T parameters);

  Future<DataResponse> changeLastName(T parameters);

  Future<DataResponse> changeEmail(T parameters);

  Future<DataResponse> changePassword(T parameters);
}
