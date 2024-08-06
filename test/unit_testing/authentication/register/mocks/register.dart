import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/dummies.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/features/authentication/register/data/sources/register_remote_data_source.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';

part 'register.mocks.dart';

@GenerateMocks([RegisterRemoteDataSourceTest, FirebaseAuthFailureTest])
class RegisterRemoteDataSourceTest extends Mock
    implements RegisterRemoteDataSourceInterface {}

class FirebaseAuthFailureTest extends Mock implements FirebaseAuthFailure {}
