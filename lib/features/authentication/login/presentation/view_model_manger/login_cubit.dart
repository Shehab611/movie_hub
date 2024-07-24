import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/usable_functions/encryption.dart';
import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';
import 'package:movie_hub/core/usable_functions/validate_check.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/features/authentication/login/domain/use_cases/login_use_case.dart';
import 'package:movie_hub/features/authentication/login/parameters/login_parameters.dart';
import 'package:movie_hub/features/authentication/shared/use_cases/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase, this._googleSignInUseCase)
      : super(const LoginInitial());

  //#region Private Variables
  final LoginUseCase _loginUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

//#endregion

  //#region getters
  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  GlobalKey<FormState> get formKey => _formKey;

  FocusNode get emailFocusNode => _emailFocusNode;

  FocusNode get passwordFocusNode => _passwordFocusNode;

//#endregion

  //#region Private Methods
  Future<void> _login(BuildContext context) async {
    emit(const LoginLoadingState());
    DataResponse response = await _loginUseCase.call(LoginParameters(
        email: _emailController.value.text,
        password: _passwordController.value.text));
    if (response is FailureDataResponse<FailureFirebaseAuthResponse>) {
      if (context.mounted) {
        FirebaseResponseChecker.checkAuthResponse(response.error, context);
      }

      emit(const LoginFailedState());
    } else {
      emit(const LoginSuccessState());
    }
  }

  Future<void> _googleSignIn(BuildContext context) async {
    emit(const LoginLoadingState());
    DataResponse response =
        await _googleSignInUseCase.call(const NoParameters());
    if (response is FailureDataResponse<FailureFirebaseAuthResponse>) {
      if (context.mounted) {
        FirebaseResponseChecker.checkAuthResponse(response.error, context);
      }

      emit(const GoogleLoginFailedState());
    } else {
      User user = (response as SuccessDataResponse<SuccessFirebaseAuthResponse>)
          .data
          .userCredential
          .user!;
      final names = user.displayName!.split(' ');
      String firstName = sl.get<EncryptionService>().encrypt(names.first);
      String lastName = sl.get<EncryptionService>().encrypt(names.last);
      user.updateDisplayName('$firstName $lastName');
      emit(const GoogleLoginSuccessState());
    }
  }

//#endregion

  //#region Public Methods
  Future<void> login(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      await _login(context);
    }
  }

  Future<void> googleSignIn(BuildContext context) async =>
      await _googleSignIn(context);

//#endregion
}
