part of '../view/register_screen.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.nextFocusNode,
      required this.password});

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final String password;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      nextFocus: nextFocusNode,
      required: true,
      isPassword: true,
      prefixIcon: Icons.lock,
      labelText:
          AppLocalizations.of(context).translate(AppStrings.confirmPassword),
      inputAction: TextInputAction.done,
      validator: (value) =>
          ValidateCheck.validateConfirmPassword(value, context, password),
    );
  }
}

class NamesTextField extends StatelessWidget {
  const NamesTextField(
      {super.key,
      required this.controllers,
      required this.nodes,
      required this.nextNodes});

  final ({
    TextEditingController firstName,
    TextEditingController lastName
  }) controllers;
  final ({FocusNode firstName, FocusNode lastName}) nodes;
  final ({FocusNode firstName, FocusNode lastName}) nextNodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key("Row $key"),
      children: [
        Expanded(
            key: Key("First Name Expanded $key"),
            child: CustomTextField(
              key: Key("First Name Text Field $key"),
              controller: controllers.firstName,
              focusNode: nodes.firstName,
              nextFocus: nextNodes.firstName,
              prefixIcon: Icons.person,
              labelText:
                  AppLocalizations.of(context).translate(AppStrings.firstName),
              validator: (value) => ValidateCheck.validateEmptyText(
                  value, context, AppStrings.requiredFirstName),
            )),
        SizedBox(
          key: Key("SizedBox $key"),
          width: 8,
        ),
        Expanded(
            key: Key("Last Name Expanded $key"),
            child: CustomTextField(
              key: Key("Last Name Text Field $key"),
              controller: controllers.firstName,
              focusNode: nodes.firstName,
              nextFocus: nextNodes.firstName,
              prefixIcon: Icons.person,
              labelText:
                  AppLocalizations.of(context).translate(AppStrings.lastName),
              validator: (value) => ValidateCheck.validateEmptyText(
                  value, context, AppStrings.requiredLastName),
            )),
      ],
    );
  }
}
