import 'package:mockito/mockito.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';
import 'package:test/test.dart';

import '../shared/mocks/firebase_mock_setup.dart';
import '../shared/mocks/user_credential/user_credential.dart';
import 'mocks/register.dart';

void main() async {
  setupFirebaseMocks();
  final MockRegisterRemoteDataSourceTest dataSource =
      MockRegisterRemoteDataSourceTest();
  final MockUserCredentialTest userCredential = MockUserCredentialTest();
  final MockFirebaseAuthFailureTest failure = MockFirebaseAuthFailureTest();
  const RegisterParameters params = RegisterParameters(
      email: 'shehabehab1029@gmail.com',
      firstName: 'shehab',
      lastName: 'ehab',
      password: '12345678');
  setUpAll(() {
    provideDummy<FirebaseAuthResponse>(
        SuccessFirebaseAuthResponse(userCredential));
    provideDummy<FirebaseAuthResponse>(FailureFirebaseAuthResponse(failure));
  });

  group('Register Remote Data Source', () {
    test('Test User Register on successful', () async {
      FirebaseAuthResponse response =
          SuccessFirebaseAuthResponse(userCredential);
      when(dataSource.userRegister(params)).thenAnswer((_) async => response);
      final res = await dataSource.userRegister(params);

      expect(res, isA<SuccessFirebaseAuthResponse>());
      expect(res, response);
    });

    test('Test User Register on Failed', () async {
      FirebaseAuthResponse response = FailureFirebaseAuthResponse(failure);

      when(dataSource.userRegister(params)).thenAnswer((_) async => response);
      final res = await dataSource.userRegister(params);

      expect(res, isA<FirebaseAuthResponse>());
      expect(res, response);
    });
  });
}
