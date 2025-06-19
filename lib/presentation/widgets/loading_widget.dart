import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_assets.dart';

class IsLoadingPage extends StatelessWidget {
  final Color? backgroundColor;

  const IsLoadingPage({this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.black.withValues(alpha: 0.4),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
        child: Center(
          child: Lottie.asset(AppAssets.lotties.loading, height: 150.h),
        ),
      ),
    );
  }
}
