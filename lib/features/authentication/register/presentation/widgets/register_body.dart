part of '../view/register_screen.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({
    super.key,
  });

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
            height: size.height * 0.4,
            child: Column(
              key: Key("Second Column ${widget.key}"),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NamesTextField(
                  key: Key("Names Text Field ${widget.key}"),
                  controllers: (
                    firstName: TextEditingController(),
                    lastName: TextEditingController()
                  ),
                  nodes: (firstName: FocusNode(), lastName: FocusNode()),
                  nextNodes: (firstName: FocusNode(), lastName: FocusNode()),
                ),
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
                ConfirmPasswordTextField(
                    key: Key("Confirm Password Text Field ${widget.key}"),
                    controller: TextEditingController(),
                    focusNode: FocusNode(),
                    nextFocusNode: FocusNode(),
                    password: 'password')
              ],
            ),
          ),
          BigActionButton(
            key: Key("Register button ${widget.key}"),
            text: AppStrings.register,
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
