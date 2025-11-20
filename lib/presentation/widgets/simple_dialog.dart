import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/extensions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import 'custom_button.dart';

void showSimpleDialog({
  String? title,
  String? body,
  String? leftBtnName,
  String? rightBtnName,
  Function()? leftBtnFunc,
  Function()? rightBtnFunc,
}) async {
  await Get.dialog(
    Center(
      child: Container(
        width: 320.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Title ----------------------------------------------------------
            30.ph,
            Visibility(
              visible: title?.isNotEmpty == true,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: AppStyles.text16sp500black1,
                  ),
                ),
              ),
            ),

            /// Body -----------------------------------------------------------
            Visibility(
              visible: body?.isNotEmpty == true,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    body ?? "",
                    textAlign: TextAlign.center,
                    style: AppStyles.text13sp400black2,
                  ),
                ),
              ),
            ),

            /// Buttons --------------------------------------------------------
            /// If leftBtnFunc is null, only show right button as full width
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  (leftBtnFunc != null)
                      ? Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: CustomButton(
                              text: leftBtnName ?? '',
                              bgColor: AppColor.white,
                              borderColor: AppColor.grBorder,
                              borderWidth: 1.5,
                              textStyle: AppStyles.text15sp1h600black1,
                              onPress: leftBtnFunc,
                            ),
                          ),
                        )
                      : 0.ph,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomButton(
                        text: rightBtnName ?? '',
                        bgColor: AppColor.blue1,
                        borderColor: AppColor.blue1,
                        textStyle: AppStyles.text15sp1h600white,
                        onPress: rightBtnFunc!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
