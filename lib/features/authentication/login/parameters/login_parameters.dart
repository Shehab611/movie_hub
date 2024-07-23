import 'package:movie_hub/core/utils/api_utils/data_response.dart';

final class LoginParameters extends Parameters {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  @override
  bool? get stringify => true;
}
