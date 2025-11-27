import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/extensions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import 'custom_button.dart';

Future<void> showCustomDialogNoGetX({
  required BuildContext context,
  String? title,
  String? body,
  String? leftBtnName,
  String? rightBtnName,
  Widget? customBody,
  bool barrierDismissible = true,
  bool closeButton = false,
  Function()? leftBtnFunc,
  Function()? rightBtnFunc,

  /// default style: [AppStyles.text16sp500black1]
  TextStyle? titleStyle,

  /// default style: [AppStyles.text13sp400black2]
  TextStyle? bodyStyle,

  /// default style: [AppStyles.text15sp1h600black1]
  TextStyle? leftBtnStyle,

  /// default style: [AppStyles.text15sp1h600white]
  TextStyle? rightBtnStyle,

  /// default color: [AppColor.white]
  Color? bgColor,

  /// default border radius: 7
  double? borderRadius,

  /// default color: [AppColor.white]
  Color? leftBtnColor,

  /// default color: [AppColor.grBorder]
  Color? leftBtnBorderColor,

  /// default color: [AppColor.blue1]
  Color? rightBtnColor,

  /// default color: [AppColor.blue1]
  Color? rightBtnBorderColor,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) => Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 320.w,
          decoration: BoxDecoration(
            color: bgColor ?? AppColor.white,
            borderRadius: BorderRadius.circular(borderRadius ?? 7),
          ),
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Close Button or Space ------------------------------------------
              closeButton
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.close,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    )
                  : 30.ph,

              /// Title ----------------------------------------------------------
              Visibility(
                visible: title?.isNotEmpty == true,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: titleStyle ?? AppStyles.text16sp500black1,
                    ),
                  ),
                ),
              ),

              /// Custom Body ---------------------------------------------------
              if (customBody != null)
                Material(color: Colors.transparent, child: customBody),

              /// Body -----------------------------------------------------------
              Visibility(
                visible: body?.isNotEmpty == true,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      body ?? "",
                      textAlign: TextAlign.center,
                      style: bodyStyle ?? AppStyles.text13sp400black2,
                    ),
                  ),
                ),
              ),

              /// Buttons --------------------------------------------------------
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
                                bgColor: leftBtnColor ?? AppColor.white,
                                borderColor:
                                    leftBtnBorderColor ?? AppColor.grBorder,
                                borderWidth: 1.5,
                                textStyle: leftBtnStyle ??
                                    AppStyles.text15sp1h600black1,
                                onPress: () {
                                  leftBtnFunc.call();
                                },
                              ),
                            ),
                          )
                        : 0.ph,
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomButton(
                          text: rightBtnName ?? '',
                          bgColor: rightBtnColor ?? AppColor.blue1,
                          borderWidth: 1.5,
                          borderColor: rightBtnBorderColor ?? AppColor.blue1,
                          textStyle:
                              rightBtnStyle ?? AppStyles.text15sp1h600white,
                          onPress: () {
                            rightBtnFunc?.call();
                          },
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
    ),
  );
}
