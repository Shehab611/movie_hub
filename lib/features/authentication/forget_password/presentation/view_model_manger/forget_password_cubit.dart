import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/usable_functions/validate_check.dart';
import 'package:movie_hub/features/authentication/forget_password/domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._repositoryInterface)
      : super(const ForgetPasswordInitial());

  @override
  Future<void> close() {
    _emailController.dispose();
    return super.close();
  }

  //#region Private Variables
  final ForgetPasswordUseCase _repositoryInterface;

  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //#endregion

  //#region Getters
  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailController => _emailController;

  //#endregion

  //#region Public Methods
  Future<void> resetPassword() async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const ForgetPasswordLoadingState());
      await _repositoryInterface.call(_emailController.text);
      emit(const ForgetPasswordSendMailState());
    }
  }
//#endregion
}
