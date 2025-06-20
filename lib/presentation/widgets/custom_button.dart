import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

//ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? text;

  /// default color: [AppColor.blue1]
  final Color bgColor;

  /// default color: [AppColor.blue1]
  final Color borderColor;

  /// default color: [AppColor.black6]
  final Color inActiveBgColor;

  /// default color: [AppColor.black6]
  final Color inActiveBorderColor;

  /// default border radius: 8
  final double borderRadius;

  /// default border width: 0
  final double borderWidth;

  /// default vertical/horizontal padding: 12
  final double vPadding;
  final double hPadding;

  /// default style: [AppStyles.text14sp600white]
  final TextStyle? textStyle;

  final bool isActive;
  final bool isMatchParent;
  final Color shadowColor;
  final double elevation;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onPress;

  CustomButton({
    super.key,
    this.text,
    this.bgColor = AppColor.blue1,
    this.borderColor = AppColor.blue1,
    this.inActiveBgColor = AppColor.black6,
    this.inActiveBorderColor = AppColor.black6,
    this.borderRadius = 8,
    this.borderWidth = 0,
    this.vPadding = 12,
    this.hPadding = 12,
    this.textStyle,
    this.isActive = true,
    this.isMatchParent = true,
    this.shadowColor = AppColor.blue1,
    this.elevation = 0,
    this.prefix,
    this.suffix,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shadowColor: shadowColor,
        elevation: elevation,
        minimumSize: isMatchParent ? const Size(double.infinity, 1) : Size.zero,
        backgroundColor: isActive ? bgColor : inActiveBgColor,
        padding: EdgeInsets.symmetric(
          horizontal: hPadding,
          vertical: vPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          color: isActive ? borderColor : inActiveBorderColor,
          width: borderWidth,
        ),
      ),
      onPressed: isActive ? onPress : null,
      child: FittedBox(
        child: Row(
          children: [
            (prefix != null) ? prefix! : SizedBox(),
            Text(
              text ?? "",
              maxLines: 1,
              style: textStyle ?? AppStyles.text14sp1h600white,
            ),
            (suffix != null) ? suffix! : SizedBox(),
          ],
        ),
      ),
    );
  }
}
