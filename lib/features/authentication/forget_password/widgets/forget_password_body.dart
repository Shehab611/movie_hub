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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset(
            AppAnimatedImages.forgetPasswordAnimation,
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
                  text: AppStrings.forgetPassword,
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
