import 'dart:isolate';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/usable_functions/encryption.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/usable_functions/validate_check.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/register/domain/use_cases/register_use_case.dart';
import 'package:movie_hub/features/authentication/register/parameters/register_parameters.dart';
import 'package:movie_hub/features/authentication/shared/use_cases/email_verification_use_case.dart';
import 'package:movie_hub/features/authentication/shared/use_cases/google_sign_in.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase, this._googleSignInUseCase,
      this._emailVerificationUseCase)
      : super(const RegisterInitial());

  //#region Private Variables
  final RegisterUseCase _registerUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final EmailVerificationUseCase _emailVerificationUseCase;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RestorableTextEditingController _emailController =
      RestorableTextEditingController();
  final RestorableTextEditingController _passwordController =
      RestorableTextEditingController();
  final RestorableTextEditingController _confirmPasswordController =
      RestorableTextEditingController();
  final RestorableTextEditingController _firstNameController =
      RestorableTextEditingController();
  final RestorableTextEditingController _lastNameController =
      RestorableTextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();

//#endregion

  //#region getters
  GlobalKey<FormState> get formKey => _formKey;

  RestorableTextEditingController get emailController => _emailController;

  RestorableTextEditingController get passwordController => _passwordController;

  RestorableTextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  FocusNode get emailFocusNode => _emailFocusNode;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  FocusNode get confirmPasswordFocusNode => _confirmPasswordFocusNode;

  RestorableTextEditingController get firstNameController =>
      _firstNameController;

  RestorableTextEditingController get lastNameController => _lastNameController;

  FocusNode get firstNameFocusNode => _firstNameFocusNode;

  FocusNode get lastNameFocusNode => _lastNameFocusNode;

//#endregion

  //#region Private Methods
  Future<void> _register(BuildContext context) async {
    emit(const RegisterLoadingState());
    RegisterParameters registerParameters = RegisterParameters(
        firstName: _firstNameController.value.text,
        lastName: _lastNameController.value.text,
        email: _emailController.value.text,
        password: _passwordController.value.text);
    DataResponse response = await _registerUseCase.call(registerParameters);
    if (response is FailureDataResponse<FailureFirebaseAuthResponse>) {
      if (context.mounted) {
        FirebaseResponseChecker.checkAuthResponse(response.error, context);
      }
      emit(const RegisterFailedState());
    } else {
      User user = (response as SuccessDataResponse<SuccessFirebaseAuthResponse>)
          .data
          .userCredential
          .user!;

      await Isolate.run(
        () {
          String firstName =
              sl.get<EncryptionService>().encrypt(registerParameters.firstName);
          String lastName =
              sl.get<EncryptionService>().encrypt(registerParameters.firstName);
          return user.updateDisplayName('$firstName $lastName');
        },
      );
      await Isolate.run(() => _sendEmailVerification(user));

      emit(const RegisterSuccessState());
    }
  }

  Future<void> _googleSignIn(BuildContext context) async {
    emit(const RegisterLoadingState());
    DataResponse response =
        await _googleSignInUseCase.call(const NoParameters());
    if (response is FailureDataResponse<FailureFirebaseAuthResponse>) {
      if (context.mounted) {
        FirebaseResponseChecker.checkAuthResponse(response.error, context);
      }

      emit(const GoogleRegisterFailedState());
    } else {
      emit(const GoogleRegisterSuccessState());
    }
  }

  Future<void> _sendEmailVerification(User user) async {
    await _emailVerificationUseCase.call(user);
  }

//#endregion

  //#region Public Methods
  Future<void> register(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      await _register(context);
    }
  }

  Future<void> googleSignIn(BuildContext context) async =>
      await _googleSignIn(context);

//#endregion
}
