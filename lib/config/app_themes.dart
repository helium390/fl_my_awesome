import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/app_colors.dart';

class AppThemes {
  static var appTheme = ThemeData(
    fontFamily: GoogleFonts.nunito().fontFamily,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      foregroundColor: AppColor.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        letterSpacing: 0.5,
        color: AppColor.textColor,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white,
    ),
  );
}
