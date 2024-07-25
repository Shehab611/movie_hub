import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/profile/data/sources/profile_remote_data_source.dart';
import 'package:movie_hub/features/profile/domain/repositories/profile_repository_interface.dart';

final class ProfileRepository implements ProfileRepositoryInterface<String> {
  final ProfileRemoteDataSourceInterface _dataSource;

  const ProfileRepository(this._dataSource);

  @override
  Future<DataResponse> changeEmail(String parameters) async {
    try {
      await _dataSource.changeEmail(parameters);
      return const SuccessDataResponse(true);
    } on FailureFirebaseAuthResponse catch (e) {
      return FailureDataResponse<FailureFirebaseAuthResponse>(e);
    }
  }

  @override
  Future<DataResponse> changeFirstName(String parameters) async {
    try {
      await _dataSource.changeFirstName(parameters);
      return const SuccessDataResponse(true);
    } on FailureFirebaseAuthResponse catch (e) {
      return FailureDataResponse<FailureFirebaseAuthResponse>(e);
    }
  }

  @override
  Future<DataResponse> changeLastName(String parameters) async {
    try {
      await _dataSource.changeLastName(parameters);
      return const SuccessDataResponse(true);
    } on FailureFirebaseAuthResponse catch (e) {
      return FailureDataResponse<FailureFirebaseAuthResponse>(e);
    }
  }

  @override
  Future<DataResponse> changePassword(String parameters) async {
    try {
      await _dataSource.changePassword(parameters);
      return const SuccessDataResponse(true);
    } on FailureFirebaseAuthResponse catch (e) {
      return FailureDataResponse<FailureFirebaseAuthResponse>(e);
    }
  }

}
