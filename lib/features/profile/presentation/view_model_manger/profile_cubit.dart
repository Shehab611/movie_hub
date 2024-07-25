import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  @override
  Future<void> close() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameNode.dispose();
    _lastNameNode.dispose();
    _emailNode.dispose();
    _currentPasswordNode.dispose();
    _newPasswordNode.dispose();
    _confirmPasswordNode.dispose();
    return super.close();
  }

  //#region Private Variables
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _firstNameNode = FocusNode();
  final FocusNode _lastNameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _currentPasswordNode = FocusNode();
  final FocusNode _newPasswordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();
  final IconData _editIcon = Icons.edit;
  final IconData _confirmIcon = Icons.check;
  final GlobalKey<FormState> _profileBodyFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _changePasswordSheetFormKey =
      GlobalKey<FormState>();

  //#endregion

  //#region Getters
  TextEditingController get firstNameController => _firstNameController;

  TextEditingController get lastNameController => _lastNameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get currentPasswordController =>
      _currentPasswordController;

  TextEditingController get newPasswordController => _newPasswordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  FocusNode get firstNameNode => _firstNameNode;

  FocusNode get lastNameNode => _lastNameNode;

  FocusNode get emailNode => _emailNode;

  FocusNode get currentPasswordNode => _currentPasswordNode;

  FocusNode get newPasswordNode => _newPasswordNode;

  FocusNode get confirmPasswordNode => _confirmPasswordNode;

  GlobalKey<FormState> get profileBodyFormKey => _profileBodyFormKey;

  GlobalKey<FormState> get changePasswordSheetFormKey =>
      _changePasswordSheetFormKey;

  //#endregion

  //#region Public Variables

  IconData emailIcon = Icons.edit;
  bool emailButtonEditButtonVisible = true;
  bool emailFieldEnabled = false;
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

  Future<void> _updateUserData(
      BuildContext context, Map<String, dynamic> updatedData) async {
    emit(const ProfileUpdateUserDataLoadingState());
    _changeEditButtonVisibility(updatedData, false);

    if (true) {
      _changeEditButtonVisibility(updatedData, true);
      emit(const ProfileUpdateUserDataSuccessfulState());
    } else {
      if (context.mounted) {
        _changeEditButtonVisibility(updatedData, true);
        emit(ProfileUpdateUserDataFailedState(''));
      }
    }
  }

  void _changeEditButtonVisibility(
      Map<String, dynamic> updatedData, bool valueToUpdate) {
    if (updatedData.keys.contains('first_name')) {
      firstNameButtonEditButtonVisible = valueToUpdate;
    } else if (updatedData.keys.contains('last_name')) {
      lastNameButtonEditButtonVisible = valueToUpdate;
    } else {
      emailButtonEditButtonVisible = valueToUpdate;
    }
  }

  void _updateUserFirstName(BuildContext context) {
    Map<String, dynamic> data = {'first_name': _firstNameController.text};
    _updateUserData(context, data);
  }

  void _updateUserLastName(BuildContext context) {
    Map<String, dynamic> data = {'last_name': _lastNameController.text};
    _updateUserData(context, data);
  }

  void _updateUserEmail(BuildContext context) {
    Map<String, dynamic> data = {'email': _emailController.text};
    _updateUserData(context, data);
  }

  void _deleteAccount() async {}

  void _changePassword(BuildContext context) async {}

  //#endregion

  //#region Public Methods
  void firstNameButtonPressed(BuildContext context) {
    if (firstNameIcon == _editIcon) {
      firstNameIcon = _confirmIcon;
      firstNameFieldEnabled = true;
      emit(const ProfileChangeFirstnameVariables());
    } else {
      firstNameIcon = _editIcon;
      firstNameFieldEnabled = false;
      emit(const ProfileChangeFirstnameVariables());
      //_updateUserEmail(context);
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
      //_updateUserEmail(context);
    }
  }

  void emailButtonPressed(BuildContext context) {
    if (emailIcon == _editIcon) {
      emailIcon = _confirmIcon;
      emailFieldEnabled = true;
      emit(const ProfileChangeEmailVariables());
    } else {
      emailIcon = _editIcon;
      emailFieldEnabled = false;
      emit(const ProfileChangeEmailVariables());
      //_updateUserEmail(context);
    }
  }

  void changePassword() {}

  void deleteAccount() {}
//#endregion
}
