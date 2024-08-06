import 'package:mockito/mockito.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';
import 'package:test/test.dart';

import '../shared/mocks/firebase_mock_setup.dart';
import '../shared/mocks/user_credential/user_credential.dart';
import 'mocks/register.dart';

void main() async {
  setupFirebaseMocks();

  //#region Mocks
  final MockRegisterRemoteDataSourceTest dataSource =
      MockRegisterRemoteDataSourceTest();

  final MockUserCredentialTest userCredential = MockUserCredentialTest();

  final MockFirebaseAuthFailureTest failure = MockFirebaseAuthFailureTest();

  final MockRegisterRepositoryTest repository = MockRegisterRepositoryTest();

  final MockRegisterUseCaseTest useCase = MockRegisterUseCaseTest();
  //#endregion

  //#region Responses
  final SuccessFirebaseAuthResponse firebaseAuthSuccessResponse =
      SuccessFirebaseAuthResponse(userCredential);

  final FailureFirebaseAuthResponse firebaseAuthFailureResponse =
      FailureFirebaseAuthResponse(failure);

  final SuccessDataResponse<FirebaseAuthResponse> successDataResponse =
      SuccessDataResponse<FirebaseAuthResponse>(firebaseAuthSuccessResponse);

  final FailureDataResponse<FirebaseAuthResponse> failureDataResponse =
      FailureDataResponse<FirebaseAuthResponse>(firebaseAuthFailureResponse);

  //#endregion

  //#region Parameters
  const RegisterParameters params =
      RegisterParameters(email: '', firstName: '', lastName: '', password: '');
  //#endregion

  setUpAll(() {
    provideDummy<FirebaseAuthResponse>(firebaseAuthSuccessResponse);
    provideDummy<FirebaseAuthResponse>(firebaseAuthFailureResponse);
    provideDummy<DataResponse>(successDataResponse);
    provideDummy<DataResponse>(failureDataResponse);
  });

  group('Remote Data Source', () {
    test('Test User Register Data Source on successful', () async {
      FirebaseAuthResponse response = firebaseAuthSuccessResponse;
      when(dataSource.userRegister(params)).thenAnswer((_) async => response);
      final res = await dataSource.userRegister(params);

      expect(res, isA<SuccessFirebaseAuthResponse>());
      expect(res, response);
    });

    test('Test User Register Data Source on Failed', () async {
      FirebaseAuthResponse response = FailureFirebaseAuthResponse(failure);

      when(dataSource.userRegister(params)).thenAnswer((_) async => response);
      final res = await dataSource.userRegister(params);

      expect(res, isA<FirebaseAuthResponse>());
      expect(res, response);
    });
  });

  group('Repository Interface', () {
    test('Test User Register Repository Interface on successful', () async {
      DataResponse response = successDataResponse;
      when(repository.userRegister(params)).thenAnswer((_) async => response);

      final res = await repository.userRegister(params);

      expect(res, isA<SuccessDataResponse>());
      expect(res, response);
    });

    test('Test User Register Repository Interface on Failed', () async {
      DataResponse response = failureDataResponse;
      when(repository.userRegister(params)).thenAnswer((_) async => response);
      final res = await repository.userRegister(params);

      expect(res, isA<FailureDataResponse>());
      expect(res, response);
    });
  });

  group('Use Case', () {
    test('Test User Register Use Case on Successful', () async {
      DataResponse response = successDataResponse;
      when(useCase.call(params)).thenAnswer((_) async => response);
      final res = await useCase.call(params);

      expect(res, isA<SuccessDataResponse>());
      expect(res, response);
    });

    test('Test User Register Use Case  on Failed', () async {
      DataResponse response = failureDataResponse;
      when(useCase.call(params)).thenAnswer((_) async => response);
      final res = await useCase.call(params);

      expect(res, isA<FailureDataResponse>());
      expect(res, response);
    });
  });
}
