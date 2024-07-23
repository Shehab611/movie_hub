import 'package:movie_hub/core/utils/api_utils/data_response.dart';

final class RegisterParameters implements Parameters {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const RegisterParameters(this.firstName, this.lastName,
      {required this.email, required this.password});

  @override
  List<Object> get props => [email, password, firstName, lastName];

  @override
  bool? get stringify => true;
}
