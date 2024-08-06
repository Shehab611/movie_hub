import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/dummies.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/register/data/sources/register_remote_data_source.dart';
import 'package:movie_hub/features/authentication/register/domain/repositories/register_repository_interface.dart';
import 'package:movie_hub/features/authentication/register/domain/use_cases/register_use_case.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';

part 'register.mocks.dart';

@GenerateMocks([
  RegisterRemoteDataSourceTest,
  FirebaseAuthFailureTest,
  RegisterRepositoryTest,
  RegisterUseCaseTest
])
class RegisterRemoteDataSourceTest extends Mock
    implements RegisterRemoteDataSourceInterface {}

class FirebaseAuthFailureTest extends Mock implements FirebaseAuthFailure {}

class RegisterRepositoryTest extends Mock
    implements RegisterRepositoryInterface<RegisterParameters> {}

class RegisterUseCaseTest extends Mock implements RegisterUseCase {}
