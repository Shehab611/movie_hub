import 'package:movie_hub/core/utils/api_utils/data_response.dart';

abstract interface class DrawerRepositoryInterface {
  Future<DataResponse> logOut();
}
