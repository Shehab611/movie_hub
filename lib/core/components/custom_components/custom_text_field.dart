part of 'custom_components.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final void Function()? onFieldSubmitted;
  final Function(String text)? onChanged;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final double borderRadius;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool showBorder;
  final List<TextInputFormatter>? inputFormatters;
  final bool required;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.capitalization = TextCapitalization.words,
    this.isPassword = false,
    this.showBorder = false,
    this.borderRadius = 8,
    this.validator,
    this.inputFormatters,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.required = false,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: widget.validator,
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      textCapitalization: widget.capitalization,
      enabled: widget.isEnabled,
      autofocus: false,
      autofillHints: AutoFillType.getHintType(widget.inputType),
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputType == TextInputType.phone
          ? <TextInputFormatter>[PhoneNumberInputFormatter()]
          : null,
      decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  key: Key("Prefix Icon Key ${widget.key}"), widget.prefixIcon!)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  key: Key("Suffix Icon Button Key ${widget.key}"),
                  icon: Icon(
                    key: Key("Suffix Icon Key ${widget.key}"),
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: _toggle)
              : widget.suffixIcon != null
                  ? SizedBox(
                      key: Key("Suffix Icon Sized box Key ${widget.key}"),
                      width: 20,
                      child: Padding(
                        key: Key("Suffix Icon padding Key ${widget.key}"),
                        padding:
                            const EdgeInsets.all(AppSizes.paddingSizeSmall),
                        child: Icon(
                          key: Key("Suffix Icon Key ${widget.key}"),
                          widget.suffixIcon!,
                        ),
                      ))
                  : null),
      onFieldSubmitted: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onFieldSubmitted,
      onChanged: widget.onChanged,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

final class PhoneNumberInputFormatter extends TextInputFormatter {
  final RegExp _allowedRegex = RegExp(r'[0-9+]');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(
      _allowedRegex,
      '',
    );
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

abstract class AutoFillType {
  static Iterable<String>? getHintType(TextInputType inputType) {
    switch (inputType) {
      case TextInputType.name:
        return [AutofillHints.name];
      case TextInputType.emailAddress:
        return [AutofillHints.email];
      case TextInputType.phone:
        return [AutofillHints.telephoneNumber];
      case TextInputType.streetAddress:
        return [AutofillHints.fullStreetAddress];
      case TextInputType.url:
        return [AutofillHints.url];
      case TextInputType.visiblePassword:
        return [AutofillHints.password];
      default:
        return null;
    }
  }
}
