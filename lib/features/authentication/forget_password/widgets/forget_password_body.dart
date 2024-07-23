part of '../view/forget_password_screen.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Form(
      //key: widget.formKey,
      child: Column(
        key: Key("First Column $key"),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            key: Key("Forget Password Animation Semantics $key"),
            label: AppLocalizations.of(context)
                .translate(AppStrings.forgetPasswordAnimationSemanticsLabel),
            child: Lottie.asset(
              key: Key("Forget Password Animation $key"),
              AppAnimatedImages.forgetPasswordAnimation,
            ),
          ),
          Text(
            key: Key("Forget Password Text $key"),
            AppLocalizations.of(context).translate(AppStrings.forgetPassword),
          ),
          Text(
            key: Key("Forget Password Text Message $key"),
            AppLocalizations.of(context)
                .translate(AppStrings.forgetPasswordMessage),
          ),
          SizedBox(
            key: Key("SizedBox $key"),
            height: size.height * 0.3,
            child: Column(
              key: Key("Second Column $key"),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EmailTextField(
                  key: Key("Email Text Field $key"),
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  nextFocusNode: FocusNode(),
                ),
                BigActionButton(
                  key: Key("Forget Password button $key"),
                  text: AppStrings.resetPassword,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
