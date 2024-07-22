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
  final bool isRequiredFill;
  final bool readOnly;
  final void Function()? onTap;
  final void Function()? suffixOnTap;
  final Function(String text)? onChanged;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final double borderRadius;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double suffixIconSize;
  final bool showBorder;
  final bool showLabelText;
  final double prefixHeight;
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
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconSize = 12,
    this.capitalization = TextCapitalization.none,
    this.readOnly = false,
    this.isPassword = false,
    this.isRequiredFill = false,
    this.showLabelText = true,
    this.showBorder = false,
    this.borderRadius = 8,
    this.prefixHeight = 50,
    this.validator,
    this.inputFormatters,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.required = false,
    this.suffixOnTap,
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
      textAlign: widget.textAlign,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      textCapitalization: widget.capitalization,
      enabled: widget.isEnabled,
      autofocus: false,
      autofillHints: widget.inputType == TextInputType.name
          ? [AutofillHints.name]
          : widget.inputType == TextInputType.emailAddress
              ? [AutofillHints.email]
              : widget.inputType == TextInputType.phone
                  ? [AutofillHints.telephoneNumber]
                  : widget.inputType == TextInputType.streetAddress
                      ? [AutofillHints.fullStreetAddress]
                      : widget.inputType == TextInputType.url
                          ? [AutofillHints.url]
                          : widget.inputType == TextInputType.visiblePassword
                              ? [AutofillHints.password]
                              : null,
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))
            ]
          : [
              ...?widget.inputFormatters,
              if (widget.inputType != TextInputType.emailAddress &&
                  !widget.isPassword)
                UpperCaseTextFormatter()
            ],
      decoration: InputDecoration(
          labelText: widget.showLabelText ? widget.labelText : null,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon != null
              ? Container(
                  key: Key("Prefix Icon Container Key ${widget.key}"),
                  width: widget.prefixHeight,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(widget.borderRadius),
                          bottomLeft: Radius.circular(widget.borderRadius))),
                  child: Center(
                      key: Key("Prefix Icon Center Key ${widget.key}"),
                      child: Icon(
                          key: Key("Prefix Icon Key ${widget.key}"),
                          widget.prefixIcon!)))
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  key: Key("Suffix Icon Button Key ${widget.key}"),
                  icon: Icon(
                    key: Key("Suffix Icon Key ${widget.key}"),
                    _obscureText ? Icons.visibility_off : Icons.visibility,
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
          : null,
      onChanged: widget.onChanged,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
