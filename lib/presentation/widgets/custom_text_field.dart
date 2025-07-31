import 'package:fl_my_awesome/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value)? function;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? title;
  final TextStyle? titleStyle;
  final double titleBottomPadding;

  final String hintText;
  final TextStyle? hintStyle;

  final Color bgColor;
  final Color bgValueColor;

  final String? errorText;
  final TextStyle? errorStyle;
  final double errorTopPadding;
  final double errorLeftPadding;

  final String? noErrorText;
  final TextStyle? noErrorStyle;
  final double noErrorTopPadding;
  final double noErrorLeftPadding;

  final bool readOnly;
  final bool isLastFieldOfPage;

  final bool obscureText;
  final bool obscureIconVisible;
  final Widget? obscureIcon;

  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final Color? focusBorderColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.titleStyle,
    this.bgColor = AppColor.greyBg,
    this.bgValueColor = AppColor.white,
    this.title,
    this.titleBottomPadding = 10,
    this.errorText,
    this.errorStyle,
    this.errorTopPadding = 5,
    this.errorLeftPadding = 2,
    this.noErrorText,
    this.noErrorStyle,
    this.noErrorTopPadding = 5,
    this.noErrorLeftPadding = 2,
    required this.controller,
    this.function,
    this.readOnly = false,
    this.isLastFieldOfPage = false,
    required this.keyboardType,
    this.focusNode,
    this.inputFormatters,
    this.obscureText = false,
    this.obscureIconVisible = false,
    this.obscureIcon,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.prefix,
    this.contentPadding,
    this.focusBorderColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = !widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title != null,
          child: Padding(
            padding: EdgeInsets.only(bottom: widget.titleBottomPadding),
            child: Text(
              widget.title ?? "",
              style: widget.titleStyle ?? AppStyles.text16sp400black2,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextField(
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            controller: widget.controller,
            cursorColor: AppColor.hintColor,
            style: const TextStyle(
              color: AppColor.textColor,
              decoration: TextDecoration.none,
            ),
            textAlign: widget.textAlign,
            onChanged: (text) {
              setState(() {
                widget.function!(text);
              });
            },
            cursorWidth: 0.75,
            autocorrect: false,
            enableSuggestions: false,
            // obscureText: widget.obscureText,
            obscureText: !_passwordVisible,
            obscuringCharacter: '●',
            inputFormatters: widget.inputFormatters,
            textInputAction: widget.isLastFieldOfPage
                ? TextInputAction.done
                : TextInputAction.next,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.prefix,
              prefixIconConstraints: const BoxConstraints(maxHeight: 45),
              suffixIcon: !widget.obscureIconVisible
                  ? widget.suffix
                  : widget.obscureText
                      ? buildObscureIcon()
                      : null,
              suffixIconConstraints: const BoxConstraints(maxHeight: 45),
              hintStyle: widget.hintStyle ?? AppStyles.text15sp400hint,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppColor.grBorder)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: widget.focusBorderColor ?? AppColor.hintColor,
                ),
              ),
              filled: true,
              fillColor: widget.controller.text.isEmpty
                  ? widget.bgColor
                  : widget.bgValueColor,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
        Visibility(
          visible: widget.errorText != null,
          child: Padding(
            padding: EdgeInsets.only(
              top: widget.errorTopPadding,
              left: widget.errorLeftPadding,
            ),
            child: Text(
              widget.errorText ?? "",
              style: widget.errorStyle ?? AppStyles.text14sp400error,
            ),
          ),
        ),
        Visibility(
          visible: (widget.noErrorText != null && widget.errorText == null),
          child: Padding(
            padding: EdgeInsets.only(
              top: widget.noErrorTopPadding,
              left: widget.noErrorLeftPadding,
            ),
            child: Text(
              widget.noErrorText ?? "",
              style: widget.noErrorStyle ?? AppStyles.text14sp400noError,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildObscureIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
      child: widget.obscureIcon ??
          (_passwordVisible
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.visibility,
                    size: 18,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.visibility_off,
                    size: 18,
                  ),
                )),
    );
  }
}
