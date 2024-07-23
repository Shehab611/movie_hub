import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';

final class EmailVerificationParameters implements Parameters {
  final User user;

  const EmailVerificationParameters(this.user);

  @override
  List<Object?> get props => [user];

  @override
  bool? get stringify => true;
}
