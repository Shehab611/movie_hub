part of '../view/email_verification_screen.dart';

class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Stack(
      key: Key("Stack $key"),
      children: [
        CustomPaint(
          key: Key("Custom Painter $key"),
          size: size,
          painter: VerificationBackgroundCurve(),
        ),
        BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
          listener: (context, state) {
            if (state is EmailSendSuccessfullyState) {
              showCustomSnackBar(
                  AppLocalizations.of(context)
                      .translate(AppStrings.mailSendSuccess),
                  context,
                  inTop: true,
                  isError: false);
            } else if (state is EmailVerifiedSuccessfullyState) {
              AppNavigator.navigateToHomeScreen(context);
            }
          },
          builder: (context, state) {
            return Padding(
              key: Key("Email Verification padding $key"),
              padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
              child: Column(
                key: Key("Column $key"),
                children: [
                  Text(
                    key: Key("Email Verification Text $key"),
                    AppLocalizations.of(context)
                        .translate(AppStrings.emailVerification),
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    key: Key("Email Verification Text Message $key"),
                    AppLocalizations.of(context)
                        .translate(AppStrings.emailVerificationMessage),
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Semantics(
                    key: Key("Email Verification Animation Semantics $key"),
                    label: AppLocalizations.of(context).translate(
                        AppStrings.emailVerificationAnimationSemanticsLabel),
                    child: RepaintBoundary(
                      key: Key(
                          "Repaint Boundary Email Verification Animation $key"),
                      child: Lottie.asset(
                        key: Key("Email Verification Animation $key"),
                        AppAnimatedImages.verificationAnimation,
                        height: size.height * .4,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    key: Key("Email Verification Resend Button $key"),
                    onPressed: () {
                      context
                          .read<EmailVerificationCubit>()
                          .sendEmailVerification();
                    },
                    child: Text(AppLocalizations.of(context)
                        .translate(AppStrings.resend)),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
