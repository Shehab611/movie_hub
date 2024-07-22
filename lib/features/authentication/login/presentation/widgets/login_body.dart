part of '../views/login_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody>
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
          LogoComponent(
            size: size,
            key: Key("Register ${widget.key}"),
          ),
          GoogleButton(
            isLogin: false,
            key: Key('Google Button ${widget.key}'),
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
                PasswordTextField(
                  key: Key("Password Text Field ${widget.key}"),
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                ),
                ForgotPasswordButton(
                  key: Key("Forget Password button ${widget.key}"),
                ),
              ],
            ),
          ),
          BigActionButton(
            key: Key("Login button ${widget.key}"),
          )
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

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      key: Key('Align $key'),
      alignment: Alignment.lerp(
          Alignment.center,
          (sl.get<AppLanguage>().appLocale == const Locale('en'))
              ? Alignment.centerRight
              : Alignment.centerLeft,
          .9)!,
      child: TextButton(
        key: Key('Text Button $key'),
        onPressed: () {},
        child: Text(
          key: Key('Text $key'),
          AppLocalizations.of(context).translate(AppStrings.forgetPassword),
        ),
      ),
    );
  }
}
