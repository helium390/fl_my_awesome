import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class ToastService {
  static showNotifMessage(String? text) {
    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();
    Get.snackbar(
      '',
      '',
      titleText: const SizedBox.shrink(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      barBlur: 0,
      overlayBlur: 0,
      borderRadius: 0,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      animationDuration: const Duration(milliseconds: 500),
      shouldIconPulse: true,
      messageText: Container(
        height: 55.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColor.toastColor,
            borderRadius: BorderRadius.circular(50.r)),
        child: Text(
          text ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 13.sp,
              color: AppColor.white,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  static showShortMessage(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static showLongMessage(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
