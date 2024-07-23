part of '../view/register_screen.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          AppNavigator.navigateToEmailVerificationScreen(context);
        } else if (state is GoogleRegisterSuccessState) {
          AppNavigator.navigateToHomeScreen(context);
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterCubit>(context);
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
                isLogin: false,
                onPressed: () {
                  cubit.googleSignIn(context);
                },
              ),
              SizedBox(
                key: Key("SizedBox $key"),
                height: size.height * 0.4,
                child: Column(
                  key: Key("Second Column $key"),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NamesTextField(
                      key: Key("Names Text Field $key"),
                      controllers: (
                        firstName: cubit.firstNameController,
                        lastName: cubit.lastNameController
                      ),
                      nodes: (
                        firstName: cubit.firstNameFocusNode,
                        lastName: cubit.lastNameFocusNode
                      ),
                      nextNodes: (
                        firstName: cubit.lastNameFocusNode,
                        lastName: cubit.emailFocusNode
                      ),
                    ),
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
                      nextFocusNode: cubit.confirmPasswordFocusNode,
                    ),
                    ConfirmPasswordTextField(
                        key: Key("Confirm Password Text Field $key"),
                        controller: cubit.confirmPasswordController,
                        focusNode: cubit.confirmPasswordFocusNode,
                        password: cubit.passwordController)
                  ],
                ),
              ),
              BigActionButton(
                key: Key("Register button $key"),
                text: AppStrings.register,
                applyShimmer: state is RegisterLoadingState,
                onPressed: () {
                  cubit.register(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
