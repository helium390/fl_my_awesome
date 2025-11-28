import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_styles.dart';
import '../../core/utils/app_colors.dart';

// ignore: must_be_immutable
class DropDownMenu<T> extends StatefulWidget {
  final String hintText;
  final Function(T value)? onSelect;
  final List<T> items;
  final bool isExpanded;

  final Color bgColor;
  final Color borderColor;
  final double borderRadius;
  final Color dropdownColor;
  final double vPadding;
  final double hPadding;

  T? value;

  DropDownMenu({
    super.key,
    required this.hintText,
    this.onSelect,
    this.items = const [],
    this.isExpanded = false,
    this.bgColor = AppColor.white,
    this.borderColor = AppColor.grBorder,
    this.borderRadius = 5,
    this.dropdownColor = AppColor.white,
    this.vPadding = 10,
    this.hPadding = 0,
    this.value,
  });

  @override
  State<DropDownMenu<T>> createState() => _DropDownMenuState<T>();
}

class _DropDownMenuState<T> extends State<DropDownMenu<T>> {
  T? _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // There is default left padding
      padding: EdgeInsets.symmetric(
        horizontal: widget.hPadding,
        vertical: widget.vPadding,
      ),
      decoration: BoxDecoration(
        color: widget.bgColor,
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<T>(
          isDense: true,
          dropdownColor: widget.dropdownColor,
          padding: const EdgeInsets.only(right: 10),
          borderRadius: BorderRadius.circular(5),
          style: AppStyles.text15sp400black3,
          hint: Text(
            widget.hintText,
            style: AppStyles.text15sp400black3,
          ),
          onChanged: (value) {
            _value = value;
            if (widget.onSelect != null) {
              widget.onSelect!(value as T);
            }
            setState(() {});
          },
          value: _value,
          underline: SizedBox(),
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              AppAssets.icons.dropdown,
              width: 12,
            ),
          ),
          isExpanded: widget.isExpanded,
          selectedItemBuilder: (BuildContext context) {
            return widget.items
                .map((T? e) => DropdownMenuItem<T>(
                    value: e,
                    child: Container(
                      // transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e.toString(),
                        style: AppStyles.text15sp400black,
                      ),
                    )))
                .toList();
          },
          items: widget.items
              .map((T? e) => DropdownMenuItem<T>(
                  value: e,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e.toString(),
                      style: AppStyles.text15sp400black,
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
