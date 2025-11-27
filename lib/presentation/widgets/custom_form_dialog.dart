import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/extensions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

Future<void> showCustomFormDialog({
  required BuildContext context,
  String? title,
  String? leftBtnName,
  String? rightBtnName,
  Widget? customBody,
  bool barrierDismissible = true,
  bool closeButton = false,
  Function()? leftBtnFunc,
  Function(Object)? rightBtnFunc,

  /// default style: [AppStyles.text16sp500black1]
  TextStyle? titleStyle,

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
  String selectedChoice = '';
  var taskController = TextEditingController();

  final List choiceList = [
    'Choice 1',
    'Choice 2',
  ];

  void setChoice(choice) {
    selectedChoice = choice;
  }

  await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) => StatefulBuilder(builder: (
      BuildContext context,
      StateSetter setState,
    ) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 320.w,
            decoration: BoxDecoration(
              color: bgColor ?? AppColor.white,
              borderRadius: BorderRadius.circular(borderRadius ?? 7),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Close Button or Space ------------------------------------------
                closeButton
                    ? Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.close,
                            size: 20.sp,
                          ),
                        ),
                      )
                    : 10.ph,

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

                /// Body ----------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        title: 'Task',
                        titleStyle: AppStyles.text14sp400black1,
                        textStyle: AppStyles.text14sp400black1,
                        hintText: 'Enter task',
                        titleBottomPadding: 3.h,
                        bgColor: AppColor.white,
                        function: (text) {
                          setState(() {});
                        },
                        controller: taskController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [],
                      ),
                      20.ph,
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            minVerticalPadding: 0,
                            horizontalTitleGap: 3,
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                          ),
                        ),
                        child: Transform(
                          transform:
                              Matrix4.translationValues(-10.0, -10.0, 0.0),
                          child: RadioGroup<String>(
                            groupValue: selectedChoice,
                            onChanged: (value) {
                              setState(() {
                                setChoice(value);
                              });
                            },
                            child: Column(
                              children: [
                                RadioListTile<String>(
                                  title: Text(
                                    'Choice 1',
                                    style: AppStyles.text16sp400black,
                                  ),
                                  value: choiceList[0],
                                  activeColor: AppColor.blue3,
                                ),
                                RadioListTile<String>(
                                  title: Text(
                                    'Choice 2',
                                    style: AppStyles.text16sp400black,
                                  ),
                                  value: choiceList[1],
                                  activeColor: AppColor.blue3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.ph,

                /// Buttons --------------------------------------------------------
                Row(
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
                                  Navigator.pop(context, false);
                                },
                              ),
                            ),
                          )
                        : 0.ph,
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomButton(
                          isActive: taskController.text.isNotEmpty &&
                              selectedChoice.isNotEmpty,
                          text: rightBtnName ?? '',
                          bgColor: rightBtnColor ?? AppColor.blue1,
                          borderWidth: 1.5,
                          borderColor: rightBtnBorderColor ?? AppColor.blue1,
                          textStyle:
                              rightBtnStyle ?? AppStyles.text15sp1h600white,
                          onPress: () async {
                            rightBtnFunc?.call({
                              'task': taskController.text,
                              'choice': selectedChoice,
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                10.ph,
              ],
            ),
          ),
        ),
      );
    }),
  );
}
