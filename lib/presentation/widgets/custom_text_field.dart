import 'package:fl_my_awesome/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
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
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.prefix,
    this.contentPadding,
    this.focusBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (
      BuildContext context,
      StateSetter setState,
    ) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != null,
            child: Padding(
              padding: EdgeInsets.only(bottom: titleBottomPadding),
              child: Text(
                title ?? "",
                style: titleStyle ?? AppStyles.text16sp400black2,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextField(
              focusNode: focusNode,
              readOnly: readOnly,
              keyboardType: keyboardType,
              textCapitalization: textCapitalization,
              controller: controller,
              cursorColor: AppColor.hintColor,
              style: const TextStyle(
                color: AppColor.textColor,
                decoration: TextDecoration.none,
              ),
              textAlign: textAlign,
              onChanged: (text) {
                setState(() {
                  function!(text);
                });
              },
              cursorWidth: 0.75,
              autocorrect: false,
              enableSuggestions: false,
              obscureText: obscureText,
              obscuringCharacter: '●',
              inputFormatters: inputFormatters,
              textInputAction: isLastFieldOfPage
                  ? TextInputAction.done
                  : TextInputAction.next,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefix,
                prefixIconConstraints: const BoxConstraints(maxHeight: 45),
                suffixIcon: suffix,
                suffixIconConstraints: const BoxConstraints(maxHeight: 45),
                hintStyle: hintStyle ?? AppStyles.text15sp400hint,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColor.grBorder)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: focusBorderColor ?? AppColor.hintColor,
                  ),
                ),
                filled: true,
                fillColor: controller.text.isEmpty ? bgColor : bgValueColor,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          Visibility(
            visible: errorText != null,
            child: Padding(
              padding: EdgeInsets.only(
                top: errorTopPadding,
                left: errorLeftPadding,
              ),
              child: Text(
                errorText ?? "",
                style: errorStyle ?? AppStyles.text14sp400error,
              ),
            ),
          ),
          Visibility(
            visible: (noErrorText != null && errorText == null),
            child: Padding(
              padding: EdgeInsets.only(
                top: noErrorTopPadding,
                left: noErrorLeftPadding,
              ),
              child: Text(
                noErrorText ?? "",
                style: noErrorStyle ?? AppStyles.text14sp400noError,
              ),
            ),
          ),
        ],
      );
    });
  }
}
