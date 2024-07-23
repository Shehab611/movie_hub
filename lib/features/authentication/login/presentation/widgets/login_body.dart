part of '../view/login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is GoogleLoginSuccessState) {
          AppNavigator.navigateToHomeScreen(context);
        }
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            key: Key("First Column $key"),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LogoComponent(
                size: size,
                key: Key("Register $key"),
              ),
              GoogleButton(
                key: Key('Google Button $key'),
                onPressed: () {
                  cubit.googleSignIn(context);
                },
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
                      controller: cubit.emailController,
                      focusNode: cubit.emailFocusNode,
                      nextFocusNode: cubit.passwordFocusNode,
                    ),
                    PasswordTextField(
                      key: Key("Password Text Field $key"),
                      controller: cubit.passwordController,
                      focusNode: cubit.passwordFocusNode,
                    ),
                    ForgotPasswordButton(
                      key: Key("Forget Password button $key"),
                    ),
                  ],
                ),
              ),
              BigActionButton(
                key: Key("Login button $key"),
                text: AppStrings.login,
                applyShimmer: state is LoginLoadingState,
                onPressed: () {
                  cubit.login(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
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
