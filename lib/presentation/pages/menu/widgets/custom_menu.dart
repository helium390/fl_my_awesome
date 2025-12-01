import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/extensions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../show_menu_controller.dart';

void showCustomMenuPopup(BuildContext context, buttonKey) {
  final RenderBox renderBox =
      buttonKey.currentContext!.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  final size = renderBox.size;

  showMenu<String>(
    context: context,
    color: AppColor.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy + size.height,
      position.dx + 200,
      position.dy + size.height + 150,
    ),
    menuPadding: EdgeInsets.zero,
    constraints: BoxConstraints(
      minWidth: 250,
      maxWidth: MediaQuery.of(context).size.width,
    ),
    items: [
      PopupMenuItem<String>(
        enabled: false,
        value: 'custom', // Prevents selection highlighting
        padding: EdgeInsets.zero,
        child: GetBuilder<ShowMenuController>(builder: (controller) {
          return Container(
            // width: 250,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColor.black.withAlpha(20),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(14, 14, 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter',
                      style: AppStyles.text24sp500black1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.filter_list,
                        color: AppColor.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                15.ph,
                Text(
                  'By size',
                  style: AppStyles.text20sp400black1,
                ),
                10.ph,
                Theme(
                  data: Theme.of(context).copyWith(
                    listTileTheme: ListTileThemeData(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      minVerticalPadding: 0,
                      horizontalTitleGap: 3,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                    ),
                  ),
                  child: Transform(
                    transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                    child: RadioGroup<String>(
                      groupValue: controller.selectedSizeType,
                      onChanged: (value) {
                        controller.setSizeType(value!);
                      },
                      child: Column(
                        children: [
                          RadioListTile<String>(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(
                              'Small',
                              style: AppStyles.text16sp600black2,
                            ),
                            value: controller.sizeType[0],
                            activeColor: AppColor.blue3,
                          ),
                          RadioListTile<String>(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(
                              'Large',
                              style: AppStyles.text16sp600black2,
                            ),
                            value: controller.sizeType[1],
                            activeColor: AppColor.blue3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                5.ph,
                Text(
                  'Date',
                  style: AppStyles.text20sp400black1,
                ),
                10.ph,
                Theme(
                  data: Theme.of(context).copyWith(
                    listTileTheme: ListTileThemeData(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      minVerticalPadding: 0,
                      horizontalTitleGap: 3,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                    ),
                  ),
                  child: Transform(
                    transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                    child: RadioGroup<String>(
                      groupValue: controller.selectedDateType,
                      onChanged: (value) {
                        controller.setDateType(value!);
                      },
                      child: Column(
                        children: [
                          RadioListTile<String>(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(
                              'New files',
                              style: AppStyles.text16sp600black2,
                            ),
                            value: controller.dateType[0],
                            activeColor: AppColor.blue3,
                          ),
                          RadioListTile<String>(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(
                              'Old files',
                              style: AppStyles.text16sp600black2,
                            ),
                            value: controller.dateType[1],
                            activeColor: AppColor.blue3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    ],
  );
}
