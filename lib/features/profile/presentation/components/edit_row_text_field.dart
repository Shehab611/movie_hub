import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';

class TextFieldWithIconButton extends StatelessWidget {
  const TextFieldWithIconButton(
      {super.key,
      required this.controller,
      required this.icon,
      required this.labelText,
      this.validator,
      this.onPressed,
      required this.enabled,
      this.buttonIcon = Icons.edit,
      this.isButtonVisible = true,
      this.focusNode,
      this.nextFocusNode});

  final TextEditingController controller;

  final IconData icon;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
  final bool enabled;
  final bool isButtonVisible;
  final IconData buttonIcon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            isEnabled: enabled,
            prefixIcon: icon,
            controller: controller,
            inputType: TextInputType.emailAddress,
            labelText: labelText,
            validator: validator,
            focusNode: focusNode,
            nextFocus: nextFocusNode,
          ),
        ),
        Visibility(
          visible: isButtonVisible,
          replacement: const CustomLoader(),
          child: IconButton(
            icon: Icon(
              buttonIcon,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
