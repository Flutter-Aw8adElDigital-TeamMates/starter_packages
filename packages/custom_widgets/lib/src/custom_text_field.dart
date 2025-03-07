import 'package:flutter/material.dart';
import 'package:core/core.dart' show AppDimensions, Validators;

class CustomTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final bool isObscureText;
  final bool isEmail;
  final bool isPassword;
  final bool isPhone;
  final bool isURL;
  final bool isMultiline;
  final double? width;
  final double? height;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? customFieldTitleWidget;
  final Color? backgroundColor;
  final int? minLines;
  final VoidCallback? onFieldTapped;
  final Function(String)? onFieldSubmitted;
  final bool isDimmed;
  final int? maxLength;
  final bool readOnly;
  final bool dismissKeyboardOnTapOutside;
  final String? initialText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String)? validator;
  final Function(String)? onChange;
  final bool isRequired;
  final AutovalidateMode autoValidationMode;
  final double? borderRadiusValue;
  final Widget? customErrorWidget;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;

  // Password validation
  final int? passwordMinLength;
  final bool? passwordMustContainUppercase;
  final bool? passwordMustContainLowercase;
  final bool? passwordMustContainSpecialChar;
  final bool? passwordMustContainDigit;

  // Phone validation
  final int? phoneMinLength;
  final int? phoneMaxLength;
  final String? phoneStartsWith;

  const CustomTextFormField({
    Key? key,
    this.focusNode,
    this.contentPadding,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.labelText,
    this.isObscureText = false,
    this.isEmail = false,
    this.isPassword = false,
    this.isPhone = false,
    this.isURL = false,
    this.isMultiline = false,
    this.width,
    this.height,
    this.suffixIcon,
    this.prefixIcon,
    this.customFieldTitleWidget,
    this.backgroundColor,
    this.minLines,
    this.onFieldTapped,
    this.onFieldSubmitted,
    this.isDimmed = false,
    this.maxLength,
    this.readOnly = false,
    this.dismissKeyboardOnTapOutside = false,
    this.initialText,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.textInputType,
    this.validator,
    this.onChange,
    this.isRequired = true,
    this.autoValidationMode = AutovalidateMode.onUserInteraction,
    this.borderRadiusValue,
    this.customErrorWidget,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.passwordMinLength,
    this.passwordMustContainUppercase,
    this.passwordMustContainLowercase,
    this.passwordMustContainSpecialChar,
    this.passwordMustContainDigit,
    this.phoneMinLength,
    this.phoneMaxLength,
    this.phoneStartsWith,
  })  : assert(!isPassword || (passwordMinLength != null && passwordMustContainUppercase != null && passwordMustContainLowercase != null && passwordMustContainSpecialChar != null && passwordMustContainDigit != null),
  'If isPassword is true, all password validation parameters must be provided'),
        assert(!isPhone || (phoneMinLength != null && phoneMaxLength != null),
        'If isPhone is true, phoneMinLength and phoneMaxLength must be provided'),
        assert(controller == null || initialText == null,
        'Provide either a controller or initialText, not both'),
        assert(!isMultiline || textInputAction == TextInputAction.newline || textInputAction == TextInputAction.none,
        'If isMultiline is true, textInputAction should be newline or none'),
        assert(width == null || width > 0, 'Width must be greater than 0 if provided'),
        assert(height == null || height > 0, 'Height must be greater than 0 if provided'),
        assert(labelText != null || hintText != null, 'Provide at least one of labelText or hintText for accessibility'),
        super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.isObscureText;
    super.initState();
  }

  String? _validateField(String? value) {
    if (widget.isRequired && (value == null || value.isEmpty)) {
      return "This field is required.";
    }
    if (widget.isEmail && !(value?.isValidEmail() ?? false)) {
      return "Please enter a valid email address.";
    }
    if (widget.isPassword && !(value?.isValidPassword(
      minLength: widget.passwordMinLength!,
      mustContainUppercase: widget.passwordMustContainUppercase!,
      mustContainLowercase: widget.passwordMustContainLowercase!,
      mustContainSpecialChar: widget.passwordMustContainSpecialChar!,
      mustContainDigit: widget.passwordMustContainDigit!,
    ) ?? false)) {
      return "Please enter a valid password.";
    }
    if (widget.isPhone && !(value?.isValidPhoneNumber(
      minLength: widget.phoneMinLength!,
      maxLength: widget.phoneMaxLength!,
      startsWith: widget.phoneStartsWith,
    ) ?? false)) {
      return "Please enter a valid phone number.";
    }
    if (widget.isURL && !(value?.isValidUrl() ?? false)) {
      return "Please enter a valid URL.";
    }
    if (widget.validator != null) {
      return widget.validator!(value ?? "");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.labelText != null || widget.customFieldTitleWidget != null) ...<Widget>[
          widget.customFieldTitleWidget !=null?widget.customFieldTitleWidget! :
              !widget.isRequired?
              Text(
                widget.labelText ?? "",
                style: widget.isDimmed
                    ? TextStyle(
                  fontSize: AppDimensions.fontSizeMedium,
                  color: Colors.grey,
                )
                    : TextStyle(
                  fontSize: AppDimensions.fontSizeMedium,
                  color: Colors.black,
                ),
              ):
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: AppDimensions.fontSizeMedium, color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: "${widget.labelText} "),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppDimensions.spacing(8)),
        ],
        SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height,
          child: TextFormField(
            focusNode: widget.focusNode,
            initialValue: widget.initialText,
            keyboardType: widget.isMultiline
                ? TextInputType.multiline
                : widget.textInputType ?? TextInputType.text,
            autovalidateMode: widget.autoValidationMode,
            onTap: widget.onFieldTapped,
            minLines: widget.isMultiline ? (widget.minLines ?? 3) : 1,
            maxLines: widget.isMultiline ? null : 1,
            textInputAction:
            widget.isMultiline ? TextInputAction.newline : widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: widget.onChange,
            readOnly: widget.readOnly || widget.onFieldTapped != null,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing(16),
                    vertical: AppDimensions.spacing(12),
                  ),
              border: widget.enabledBorder,
              focusedBorder: widget.focusedBorder,
              enabledBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(
                      widget.borderRadiusValue ?? AppDimensions.cardBorderRadius,
                    ),
                  ),
              errorBorder: widget.errorBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.5),
                    borderRadius: BorderRadius.circular(
                      widget.borderRadiusValue ?? AppDimensions.cardBorderRadius,
                    ),
                  ),
              focusedErrorBorder: widget.focusedErrorBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.5),
                    borderRadius: BorderRadius.circular(
                      widget.borderRadiusValue ?? AppDimensions.cardBorderRadius,
                    ),
                  ),
              hintStyle: widget.hintStyle ??
                  TextStyle(
                    fontSize: AppDimensions.fontSizeSmall,
                    color: Colors.grey,
                  ),
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObscureText
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
                  : widget.suffixIcon,
              fillColor: widget.backgroundColor ?? Colors.white,
              filled: true,
            ),
            obscureText: widget.isPassword ? obscureText : widget.isObscureText,
            obscuringCharacter: '*',
            onTapOutside: widget.dismissKeyboardOnTapOutside
                ? (PointerDownEvent event) {
              FocusScope.of(context).unfocus();
            }
                : null,
            style: widget.inputTextStyle ??
                TextStyle(
                  fontSize: AppDimensions.fontSizeMedium,
                  color: widget.isDimmed ? Colors.grey : Colors.black,
                ),
            validator: _validateField,
          ),
        ),
      ],
    );
  }
}
