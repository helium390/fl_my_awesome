import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

//ignore: must_be_immutable
class CustomSwitch extends StatefulWidget {
  bool value;
  final double tScale;
  final Function(bool)? onChanged;
  final Color activeThumbColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final bool iconSizeBigger;

  CustomSwitch({
    super.key,
    required this.value,
    this.tScale = 1.0,
    required this.onChanged,
    this.activeThumbColor = AppColor.white,
    this.activeTrackColor = AppColor.green1,
    this.inactiveThumbColor = AppColor.green1,
    this.inactiveTrackColor = AppColor.white,
    this.iconSizeBigger = true,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.tScale,
      child: Switch(
        value: widget.value,
        activeThumbColor: widget.activeThumbColor,
        activeTrackColor: widget.activeTrackColor,
        inactiveThumbColor: widget.inactiveThumbColor,
        inactiveTrackColor: widget.inactiveTrackColor,
        thumbIcon: widget.iconSizeBigger
            ? WidgetStateProperty.all(const Icon(null))
            : null,
        onChanged: (bool value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          setState(() {
            widget.value = value;
          });
        },
      ),
    );
  }
}
