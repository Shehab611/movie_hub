import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:movie_hub/core/base_use_case/base_use_case.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/usable_functions/encryption.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/profile/domain/use_cases/main_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._useCases) : super(const ProfileInitial());

  @override
  Future<void> close() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameNode.dispose();
    _lastNameNode.dispose();
    _currentPasswordNode.dispose();
    _newPasswordNode.dispose();
    _confirmPasswordNode.dispose();
    return super.close();
  }

  //#region Private Variables
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _firstNameNode = FocusNode();
  final FocusNode _lastNameNode = FocusNode();
  final FocusNode _currentPasswordNode = FocusNode();
  final FocusNode _newPasswordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();
  final IconData _editIcon = Icons.edit;
  final IconData _confirmIcon = Icons.check;
  final GlobalKey<FormState> _profileBodyFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _changePasswordSheetFormKey =
      GlobalKey<FormState>();
  final ProfileMainUseCases _useCases;
  final _user = sl.get<FirebaseAuth>().currentUser!;
  final _names = sl.get<FirebaseAuth>().currentUser!.displayName!.split(' ');

  //#endregion

  //#region Getters
  TextEditingController get firstNameController => _firstNameController;

  TextEditingController get lastNameController => _lastNameController;


  TextEditingController get currentPasswordController =>
      _currentPasswordController;

  TextEditingController get newPasswordController => _newPasswordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  FocusNode get firstNameNode => _firstNameNode;

  FocusNode get lastNameNode => _lastNameNode;


  FocusNode get currentPasswordNode => _currentPasswordNode;

  FocusNode get newPasswordNode => _newPasswordNode;

  FocusNode get confirmPasswordNode => _confirmPasswordNode;

  GlobalKey<FormState> get profileBodyFormKey => _profileBodyFormKey;

  GlobalKey<FormState> get changePasswordSheetFormKey =>
      _changePasswordSheetFormKey;

  //#endregion

  //#region Public Variables

  IconData firstNameIcon = Icons.edit;
  bool firstNameButtonEditButtonVisible = true;
  bool firstNameFieldEnabled = false;
  IconData lastNameIcon = Icons.edit;
  bool lastNameButtonEditButtonVisible = true;
  bool lastNameFieldEnabled = false;

//#endregion

  //#region Private Methods
  Future<bool> _authenticateWithBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    return await auth.authenticate(
      localizedReason: 'Authenticate with Fingerprint or Face ID',
      options: const AuthenticationOptions(
        stickyAuth: true,
      ),
    );
  }

  Future<void> _updateUserData(BuildContext context,
      BaseUseCaseInterface useCase, String data) async {
    emit(const ProfileUpdateUserDataLoadingState());
    _changeEditButtonVisibility(useCase, false);
    DataResponse response = await useCase.call(data);
    if (response is FailureDataResponse<FailureFirebaseAuthResponse>) {
      if (context.mounted) {
        _changeEditButtonVisibility(useCase, true);
        FirebaseResponseChecker.checkAuthResponse(response.error, context);
        emit(const ProfileUpdateUserDataFailedState());
      }
    } else {
      _changeEditButtonVisibility(useCase, true);
      emit(const ProfileUpdateUserDataSuccessfulState());
    }
  }

  void _changeEditButtonVisibility(BaseUseCaseInterface useCase,
      bool valueToUpdate,) {
    if (useCase is ChangeFirstNameUseCase) {
      firstNameButtonEditButtonVisible = valueToUpdate;
    } else if (useCase is ChangeLastNameUseCase) {
      lastNameButtonEditButtonVisible = valueToUpdate;
    }
  }

  void _updateUserFirstName(BuildContext context) {
    if (_firstNameController.text ==
        sl.get<EncryptionService>().decrypt(_names[0])) {
      emit(const ProfileSameDataState());
      return;
    }
    _updateUserData(context, _useCases.changeFirstNameUseCase,
        sl.get<EncryptionService>().encrypt(_firstNameController.text));
  }

  void _updateUserLastName(BuildContext context) {
    if (_lastNameController.text ==
        sl.get<EncryptionService>().decrypt(_names[1])) {
      emit(const ProfileSameDataState());
      return;
    }
    _updateUserData(context, _useCases.changeLastNameUseCase,
        sl.get<EncryptionService>().encrypt(_lastNameController.text));
  }

  bool _isPasswordProvider() {
    return _user.providerData.any(
      (element) => element.providerId == 'password',
    );
  }

  void _changePassword(BuildContext context) async {
    emit(const ProfileChangePasswordLoadingState());
    try {
      if (_isPasswordProvider()) {
        await _user.reauthenticateWithCredential(EmailAuthProvider.credential(
            email: _user.email!, password: _currentPasswordController.text));
      }
    } catch (e) {
      emit(const ProfileChangePasswordFailedState());
      return;
    }

    DataResponse response = await _useCases.changePasswordUseCase
        .call(_confirmPasswordController.text);
    if (response is FailureDataResponse<FailureFirebaseAuthResponse>) {
      if (context.mounted) {
        FirebaseResponseChecker.checkAuthResponse(response.error, context);
        emit(const ProfileChangePasswordFailedState());
      }
    } else {
      if (context.mounted) {
        Navigator.pop(context);
      }
      emit(const ProfileChangePasswordSuccessState());
    }
  }

  void _checkBiometrics(
      void Function(BuildContext) onSuccess, BuildContext context) async {
    if (await _authenticateWithBiometrics()) {
      if (context.mounted) {
        onSuccess(context);
      }
    } else {
      emit(const ProfileBiometricFailedState());
    }
  }

  //#endregion

  //#region Public Methods
  void firstNameButtonPressed(BuildContext context) async {
    if (firstNameIcon == _editIcon) {
      firstNameIcon = _confirmIcon;
      firstNameFieldEnabled = true;
      emit(const ProfileChangeFirstnameVariables());
    } else {
      firstNameIcon = _editIcon;
      firstNameFieldEnabled = false;
      emit(const ProfileChangeFirstnameVariables());
      _updateUserFirstName(context);
    }
  }

  void lastNameButtonPressed(BuildContext context) {
    if (lastNameIcon == _editIcon) {
      lastNameIcon = _confirmIcon;
      lastNameFieldEnabled = true;
      emit(const ProfileChangeLastNameVariables());
    } else {
      lastNameIcon = _editIcon;
      lastNameFieldEnabled = false;
      emit(const ProfileChangeLastNameVariables());
      _updateUserLastName(context);
    }
  }

  void changePassword(BuildContext context) {
    _checkBiometrics(_changePassword, context);
  }

  void putData() {
    _firstNameController.text = sl.get<EncryptionService>().decrypt(_names[0]);
    _lastNameController.text = sl.get<EncryptionService>().decrypt(_names[1]);
  }

  bool isPasswordProvider() => _isPasswordProvider();
//#endregion
}
