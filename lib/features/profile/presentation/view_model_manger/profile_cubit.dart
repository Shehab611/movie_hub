import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  //#region Public Methods
  void firstNameButtonPressed(BuildContext context) {}

  void lastNameButtonPressed(BuildContext context) {}

  void emailButtonPressed(BuildContext context) {}

  void changePassword() {}
//#endregion
}
