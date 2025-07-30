import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value)? function;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String hintText;
  final double hintSize;
  final Color hintColor;
  final Color obscureColor;
  final Color bgColor;
  final Color bgValueColor;
  final String? title;
  final String? errorText;
  final String? noErrorText;
  final bool readOnly;
  final bool isLastFieldOfPage;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintSize = 16,
    this.hintColor = AppColor.hintColor,
    this.obscureColor = AppColor.hint1,
    this.bgColor = AppColor.greyBg,
    this.bgValueColor = AppColor.white,
    this.title,
    this.errorText,
    this.noErrorText,
    required this.controller,
    this.function,
    this.readOnly = false,
    this.isLastFieldOfPage = false,
    required this.keyboardType,
    this.focusNode,
    this.inputFormatters,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.contentPadding,
    this.hintStyle,
    this.labelStyle,
    this.floatingLabelStyle,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = !widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      onChanged: (text) {
        setState(() {
          widget.function!(text);
        });
      },
      obscureText: !_passwordVisible,
      controller: widget.controller,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.controller.text.isEmpty
            ? widget.bgColor
            : widget.bgValueColor,
        isDense: true,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColor.grBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColor.hintColor),
        ),
        labelStyle: widget.labelStyle ?? AppStyles.text16sp400black3,
        floatingLabelStyle:
            widget.floatingLabelStyle ?? AppStyles.text20sp400black3,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? AppStyles.text16sp400black3,
        suffixIcon: !widget.obscureText
            ? const Icon(null)
            : IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: widget.obscureColor,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
      ),
    );
  }
}
