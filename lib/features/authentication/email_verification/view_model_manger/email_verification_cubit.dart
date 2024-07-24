import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/shared/use_cases/logout_use_case.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/features/authentication/shared/use_cases/email_verification_use_case.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(
      this._emailVerificationUseCase, this._logoutVerificationUseCase)
      : super(const EmailVerificationInitial());

  //#region Private Variables
  final EmailVerificationUseCase _emailVerificationUseCase;
  final LogoutUseCase _logoutVerificationUseCase;

  //#endregion

  //#region Public Methods
  Future<void> sendEmailVerification() async {
    await _emailVerificationUseCase.call(sl.get<FirebaseAuth>().currentUser!);
    emit(const EmailSendSuccessfullyState());
  }

  Future<void> checkIfUserEmailVerified() async {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        sl.get<FirebaseAuth>().currentUser!.reload().then(
          (value) {
            if (sl.get<FirebaseAuth>().currentUser!.emailVerified) {
              timer.cancel();
              emit(const EmailVerifiedSuccessfullyState());
            }
          },
        );
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    await _logoutVerificationUseCase.call(const NoParameters());
    if (context.mounted) {
      AppNavigator.navigateToOpenScreen(context);
    }
  }
//#endregion
}
