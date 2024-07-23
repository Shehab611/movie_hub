part of '../view/register_screen.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({
    super.key,
    required this.cubit,
    required this.state,
  });

  final RegisterCubit cubit;
  final RegisterState state;

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody>
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
            isLogin: false,
            key: Key('Google Button ${widget.key}'),
          ),
          SizedBox(
            key: Key("SizedBox ${widget.key}"),
            height: size.height * 0.4,
            child: Column(
              key: Key("Second Column ${widget.key}"),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NamesTextField(
                  key: Key("Names Text Field ${widget.key}"),
                  controllers: (
                    firstName: widget.cubit.firstNameController.value,
                    lastName: widget.cubit.lastNameController.value
                  ),
                  nodes: (
                    firstName: widget.cubit.firstNameFocusNode,
                    lastName: widget.cubit.lastNameFocusNode
                  ),
                  nextNodes: (
                    firstName: widget.cubit.lastNameFocusNode,
                    lastName: widget.cubit.emailFocusNode
                  ),
                ),
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
                  nextFocusNode: widget.cubit.confirmPasswordFocusNode,
                ),
                ConfirmPasswordTextField(
                    key: Key("Confirm Password Text Field ${widget.key}"),
                    controller: widget.cubit.confirmPasswordController.value,
                    focusNode: widget.cubit.emailFocusNode,
                    password: widget.cubit.passwordController.value.text)
              ],
            ),
          ),
          BigActionButton(
            key: Key("Register button ${widget.key}"),
            text: AppStrings.register,
            applyShimmer: widget.state is RegisterLoadingState,
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
        widget.cubit.emailController, ElementsRestorationIds.registerEmailId);
    registerForRestoration(widget.cubit.passwordController,
        ElementsRestorationIds.registerPasswordId);
    registerForRestoration(widget.cubit.confirmPasswordController,
        ElementsRestorationIds.registerConfirmPasswordId);
    registerForRestoration(widget.cubit.firstNameController,
        ElementsRestorationIds.registerFirstNameId);
    registerForRestoration(widget.cubit.lastNameController,
        ElementsRestorationIds.registerLastNameId);
  }

  @override
  bool get wantKeepAlive => true;
}
