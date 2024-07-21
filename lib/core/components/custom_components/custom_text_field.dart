part of 'custom_components.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? titleText;
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
  final bool filled;
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
    this.titleText,
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
    this.filled = true,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null)
          RichText(
              text: TextSpan(
                  text: widget.titleText ?? "",
                  //style: AppTextStyles.defaultTextStyle,
                  children: [
                if (widget.isRequiredFill)
                  TextSpan(
                      text: " *",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.red))
              ])),
        if (widget.titleText != null) const SizedBox(height: 8),
        TextFormField(
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
                              : widget.inputType ==
                                      TextInputType.visiblePassword
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
                      width: widget.prefixHeight,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(widget.borderRadius),
                              bottomLeft:
                                  Radius.circular(widget.borderRadius))),
                      child: Center(child: Icon(widget.prefixIcon!)))
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _toggle)
                  : widget.suffixIcon != null
                      ? SizedBox(
                          width: 20,
                          child: Padding(
                            padding:
                                const EdgeInsets.all(AppSizes.paddingSizeSmall),
                            child: Icon(
                              widget.suffixIcon!,
                            ),
                          ))
                      : null),
          onFieldSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : null,
          onChanged: widget.onChanged,
        ),
      ],
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
