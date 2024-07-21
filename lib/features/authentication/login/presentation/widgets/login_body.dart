part of '../views/login_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> with RestorationMixin,AutomaticKeepAliveClientMixin  {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Size size = MediaQuery.sizeOf(context);
    return Form(
      //key: widget.formKey,
      child: Column(
        key:  Key("First Column ${widget.key}"),
        children: [
          HeroAnimation(
            key:  Key("Hero ${widget.key}"),
            tag: AppTags.loginLogoTag,
            child: Image.asset(
              key:  Key("Image ${widget.key}"),
              AppImages.logo,
              height: size.height * 0.3,
            ),
          ),
          SizedBox(
            key:  Key("SizedBox ${widget.key}"),
            height: size.height * 0.38,
            child: Column(
              key:  Key("Second Column ${widget.key}"),
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
                 LoginButton(
                   key: Key("Login button ${widget.key}"),
                 ),

              ],
            ),
          ),
           RegisterButton(
             key: Key("Register button ${widget.key}"),
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
