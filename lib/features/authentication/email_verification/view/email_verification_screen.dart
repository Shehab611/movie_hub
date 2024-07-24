import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_images.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/authentication/email_verification/view_model_manger/email_verification_cubit.dart';

part '../widgets/curve_painter.dart';
part '../widgets/email_verification_body.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Email Verification Scaffold Semantics $key'),
      label: AppLocalizations.of(context)
          .translate(AppStrings.emailVerificationScaffoldSemanticLabel),
      child: Scaffold(
        key: Key('Email Verification Scaffold $key'),
        appBar: AppBar(
          key: Key('Email Verification AppBar $key'),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<EmailVerificationCubit>().logout(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: EmailVerificationBody(
          key: Key("Email Verification body $key"),
        ),
      ),
    );
  }
}
