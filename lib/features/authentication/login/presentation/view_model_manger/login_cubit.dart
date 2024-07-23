import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Future<void> _login() async {
    emit(const LoginLoadingState());
    DataResponse response = await _loginUseCase.call(LoginParameters(
        email: _emailController.text, password: _passwordController.text));
    if (response is SuccessDataResponse) {
      emit(const LoginSuccessState());
    } else {
      emit(const LoginFailedState());
    }
  }

  Future<void> _googleSignIn() async {
    emit(const LoginLoadingState());
    DataResponse response =
        await _googleSignInUseCase.call(const NoParameters());
    if (response is SuccessDataResponse) {
      emit(const GoogleLoginSuccessState());
    } else {
      emit(const GoogleLoginFailedState());
    }
  }

//#endregion

  //#region Public Methods
  Future<void> login() async {
    if (ValidateCheck.validate(_formKey)) {
      await _login();
    }
  }

  Future<void> googleSignIn() async => await _googleSignIn();

//#endregion
}
