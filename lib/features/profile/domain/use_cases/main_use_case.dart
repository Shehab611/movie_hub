import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/profile/domain/repositories/profile_repository_interface.dart';

part 'change_first_name_use_case.dart';
part 'change_last_name_use_case.dart';
part 'change_password_use_case.dart';

final class ProfileMainUseCases {
  final ChangeFirstNameUseCase changeFirstNameUseCase;
  final ChangeLastNameUseCase changeLastNameUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  const ProfileMainUseCases(
    this.changeFirstNameUseCase,
    this.changeLastNameUseCase,
    this.changePasswordUseCase,
  );
}
