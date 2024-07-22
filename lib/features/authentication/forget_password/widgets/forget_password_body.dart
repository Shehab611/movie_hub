part of '../view/forget_password_screen.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({
    super.key,
  });

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody>
    with RestorationMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Size size = MediaQuery.sizeOf(context);
    return Form(
      //key: widget.formKey,
      child: Column(
        key: Key("First Column ${widget.key}"),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            key: Key("Forget Password Animation Semantics ${widget.key}"),
            label: AppLocalizations.of(context)
                .translate(AppStrings.forgetPasswordAnimationSemanticsLabel),
            child: Lottie.asset(
              key: Key("Forget Password Animation ${widget.key}"),
              AppAnimatedImages.forgetPasswordAnimation,
            ),
          ),
          Text(
            key: Key("Forget Password Text ${widget.key}"),
            AppLocalizations.of(context).translate(AppStrings.forgetPassword),
          ),
          Text(
            key: Key("Forget Password Text Message ${widget.key}"),
            AppLocalizations.of(context)
                .translate(AppStrings.forgetPasswordMessage),
          ),
          SizedBox(
            key: Key("SizedBox ${widget.key}"),
            height: size.height * 0.3,
            child: Column(
              key: Key("Second Column ${widget.key}"),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EmailTextField(
                  key: Key("Email Text Field ${widget.key}"),
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  nextFocusNode: FocusNode(),
                ),
                BigActionButton(
                  key: Key("Forget Password button ${widget.key}"),
                  text: AppStrings.resetPassword,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  String? get restorationId => AppRestorationIds.loginId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    //registerForRestoration(widget.emailController, ElementsRestorationIds.loginEmailId);
    //registerForRestoration(widget.passwordController, ElementsRestorationIds.loginPasswordId);
  }

  @override
  bool get wantKeepAlive => true;
}
