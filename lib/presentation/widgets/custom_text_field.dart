import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? function;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String hintText;
  final double hintSize;
  final double titleSize;
  final Color hintColor;
  final Color titleColor;
  final FontWeight titleFontWeight;
  final Color bgColor;
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
  final Widget? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final Color? focusBorderColor;

  const CustomTextField(
      {super.key,
        required this.hintText,
        this.hintSize = 16,
        this.titleSize = 16,
        this.hintColor = AppColor.hintColor,
        this.titleColor = AppColor.greyBg,
        this.titleFontWeight = FontWeight.w700,
        this.bgColor = AppColor.greyBg,
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
        this.prefix,
        this.contentPadding,
        this.focusBorderColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title ?? "",
                style: TextStyle(
                    fontSize: titleSize,
                    color: titleColor,
                    fontWeight: titleFontWeight)),
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
            onChanged: function,
            cursorWidth: 0.75,
            autocorrect: false,
            enableSuggestions: false,
            obscureText: obscureText,
            obscuringCharacter: '●',
            inputFormatters: inputFormatters,
            textInputAction:
            isLastFieldOfPage ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefix,
              prefixIconConstraints: const BoxConstraints(maxHeight: 45),
              suffixIcon: suffix,
              suffixIconConstraints: const BoxConstraints(maxHeight: 45),
              hintStyle: TextStyle(fontSize: hintSize, color: hintColor),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppColor.grBorder)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: focusBorderColor ?? AppColor.hintColor)),
              filled: true,
              fillColor: bgColor,
              contentPadding:
              contentPadding ?? const EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
        Visibility(
          visible: errorText != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(errorText ?? "",
                style:
                const TextStyle(fontSize: 14, color: AppColor.errorText)),
          ),
        ),

        // New added
        Visibility(
          visible: (noErrorText != null && errorText == null),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(noErrorText ?? "",
                style:
                const TextStyle(fontSize: 14, color: AppColor.noErrorText)),
          ),
        ),
      ],
    );
  }
}
