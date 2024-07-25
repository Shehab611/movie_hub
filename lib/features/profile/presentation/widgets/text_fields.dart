part of '../view/profile_screen.dart';

class FirstNameTextField extends StatelessWidget {
  const FirstNameTextField({super.key, required this.cubit});

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextFieldWithIconButton(
      key: Key('First Name Text Field $key'),
      controller: cubit.firstNameController,
      focusNode: cubit.firstNameNode,
      nextFocusNode: cubit.lastNameNode,
      icon: Icons.person,
      labelText: AppLocalizations.of(context).translate(AppStrings.firstName),
      buttonIcon: cubit.firstNameIcon,
      validator: (value) => ValidateCheck.validateEmptyText(
          value, context, AppStrings.requiredFirstName),
      enabled: cubit.firstNameFieldEnabled,
      isButtonVisible: cubit.firstNameButtonEditButtonVisible,
      onPressed: () {
        cubit.firstNameButtonPressed(context);
      },
    );
  }
}

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({super.key, required this.cubit});

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextFieldWithIconButton(
      key: Key('Last Name Text Field $key'),
      controller: cubit.lastNameController,
      focusNode: cubit.lastNameNode,
      icon: Icons.person,
      labelText: AppLocalizations.of(context).translate(AppStrings.lastName),
      buttonIcon: cubit.lastNameIcon,
      validator: (value) => ValidateCheck.validateEmptyText(
          value, context, AppStrings.requiredLastName),
      enabled: cubit.lastNameFieldEnabled,
      isButtonVisible: cubit.lastNameButtonEditButtonVisible,
      onPressed: () {
        cubit.lastNameButtonPressed(context);
      },
    );
  }
}

class CurrentPasswordTextField extends StatelessWidget {
  const CurrentPasswordTextField({super.key, required this.cubit});

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      key: Key('Current password text field $key'),
      controller: cubit.currentPasswordController,
      focusNode: cubit.currentPasswordNode,
      nextFocus: cubit.newPasswordNode,
      prefixIcon: Icons.lock,
      labelText: AppLocalizations.of(context).translate(AppStrings.password),
      inputAction: TextInputAction.next,
      isPassword: true,
      validator: (value) => ValidateCheck.validatePassword(value, context),
    );
  }
}

class NewPasswordTextField extends StatelessWidget {
  const NewPasswordTextField({super.key, required this.cubit});

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      key: Key('New password text field $key'),
      controller: cubit.newPasswordController,
      focusNode: cubit.newPasswordNode,
      nextFocus: cubit.confirmPasswordNode,
      prefixIcon: Icons.lock,
      labelText: AppLocalizations.of(context).translate(AppStrings.newPassword),
      inputAction: TextInputAction.next,
      isPassword: true,
      validator: (value) => ValidateCheck.validatePassword(value, context),
    );
  }
}

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({super.key, required this.cubit});

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      key: Key('Confirm password text field $key'),
      controller: cubit.confirmPasswordController,
      focusNode: cubit.confirmPasswordNode,
      prefixIcon: Icons.lock,
      labelText:
          AppLocalizations.of(context).translate(AppStrings.confirmNewPassword),
      inputAction: TextInputAction.next,
      isPassword: true,
      validator: (value) => ValidateCheck.validateConfirmPassword(
          value, context, cubit.newPasswordController.text),
    );
  }
}
