import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/extensions.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool checked;
  final void Function()? function;

  final Color checkedFillColor;
  final Color uncheckedFillColor;
  final Color checkedBorderColor;
  final Color uncheckedBorderColor;
  final double borderWidth;
  final double borderRadius;
  final Widget? childIcon;

  const CustomCheckbox({
    required this.function,
    this.checked = false,
    this.checkedFillColor = AppColor.blue3,
    this.uncheckedFillColor = AppColor.grey11,
    this.checkedBorderColor = AppColor.blue3,
    this.uncheckedBorderColor = AppColor.grey11,
    this.borderWidth = 1.0,
    this.borderRadius = 5.0,
    this.childIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.elasticOut,
      switchOutCurve: Curves.elasticOut,
      duration: const Duration(milliseconds: 350),
      child: GestureDetector(
        onTap: function,
        behavior: HitTestBehavior.translucent,
        child: Container(
          key: ValueKey(checked),
          padding: const EdgeInsets.all(2),
          height: 18.h,
          width: 18.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: checked ? checkedFillColor : uncheckedFillColor,
            border: Border.all(
              color: checked ? checkedBorderColor : uncheckedBorderColor,
              width: borderWidth,
            ),
          ),
          child: checked
              ? childIcon ??
                  SvgPicture.asset(
                    AppAssets.icons.verify,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )
              : 0.ph,
        ),
      ),
    );
  }
}
