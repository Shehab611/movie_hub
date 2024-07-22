part of 'shared_components.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.nextFocusNode});

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      nextFocus: nextFocusNode,
      required: true,
      prefixIcon: Icons.alternate_email,
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.next,
      labelText: AppLocalizations.of(context).translate(AppStrings.email),
      validator: (value) => ValidateCheck.validateEmail(value, context),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      this.nextFocusNode});

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      prefixIcon: Icons.lock,
      labelText: AppLocalizations.of(context).translate(AppStrings.password),
      inputAction: TextInputAction.next,
      isPassword: true,
      validator: (value) => ValidateCheck.validatePassword(value, context),
    );
  }
}
