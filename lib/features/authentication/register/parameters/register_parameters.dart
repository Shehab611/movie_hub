import 'package:movie_hub/core/utils/api_utils/data_response.dart';

final class RegisterParameters implements Parameters {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const RegisterParameters({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [email, password, firstName, lastName];

  @override
  bool? get stringify => true;
}
