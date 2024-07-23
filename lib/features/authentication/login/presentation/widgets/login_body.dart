part of '../view/login_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
    required this.cubit,
    required this.state,
  });

  final LoginCubit cubit;
  final LoginState state;
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
      key: widget.cubit.formKey,
      child: Column(
        key: Key("First Column ${widget.key}"),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LogoComponent(
            size: size,
            key: Key("Register ${widget.key}"),
          ),
          GoogleButton(
            key: Key('Google Button ${widget.key}'),
            onPressed: () {
              widget.cubit.googleSignIn(context);
            },
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
                  controller: widget.cubit.emailController.value,
                  focusNode: widget.cubit.emailFocusNode,
                  nextFocusNode: widget.cubit.passwordFocusNode,
                ),
                PasswordTextField(
                  key: Key("Password Text Field ${widget.key}"),
                  controller: widget.cubit.passwordController.value,
                  focusNode: widget.cubit.passwordFocusNode,
                ),
                ForgotPasswordButton(
                  key: Key("Forget Password button ${widget.key}"),
                ),
              ],
            ),
          ),
          BigActionButton(
            key: Key("Login button ${widget.key}"),
            text: AppStrings.login,
            applyShimmer: widget.state is LoginLoadingState,
            onPressed: () {
              widget.cubit.login(context);
            },
          )
        ],
      ),
    );
  }

  @override
  String? get restorationId => AppRestorationIds.loginId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(
        widget.cubit.emailController, ElementsRestorationIds.loginEmailId);
    registerForRestoration(widget.cubit.passwordController,
        ElementsRestorationIds.loginPasswordId);
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
        onPressed: () {
          AppNavigator.navigateToForgetPasswordScreen(context);
        },
        child: Text(
          key: Key('Text $key'),
          AppLocalizations.of(context).translate(AppStrings.forgetPassword),
        ),
      ),
    );
  }
}
