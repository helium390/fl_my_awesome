import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class Dividers {
  static divider0h05t02black02() {
    return Divider(
      height: 0,
      color: AppColor.black.withValues(alpha: 0.2),
      thickness: 0.5,
    );
  }

  static divider0h1tBlack() {
    return Divider(
      height: 0,
      color: AppColor.black,
      thickness: 1,
    );
  }

  static divider0h05t01red() {
    return Divider(
      height: 0,
      color: AppColor.red1,
      thickness: 0.3,
    );
  }
}
