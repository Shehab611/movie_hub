import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

part 'user_credential.mocks.dart';

@GenerateMocks([UserCredentialTest])
class UserCredentialTest extends Mock implements UserCredential {}
