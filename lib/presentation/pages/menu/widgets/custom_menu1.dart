import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/extensions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../show_menu_controller.dart';

OverlayEntry? _overlayEntry;

void showCustomOverlayPopup(BuildContext context, GlobalKey buttonKey) {
  final RenderBox renderBox =
      buttonKey.currentContext!.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  final size = renderBox.size;

  _overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        // Transparent barrier to detect outside taps
        Positioned.fill(
          child: GestureDetector(
            onTap: () => _hideOverlayPopup(),
            child: Container(color: Colors.transparent),
          ),
        ),
        Positioned(
          // left: position.dx, // No automatic padding applied
          top: position.dy + size.height + 8,
          // right: position.dy - size.width - 18,
          right: position.dx,
          child: Material(
            color: Colors.transparent,
            child: GetBuilder<ShowMenuController>(builder: (controller) {
              return Container(
                width: 250,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.black.withAlpha(30),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(14, 14, 5, 14),
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
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                title: Text(
                                  'Small',
                                  style: AppStyles.text16sp600black2,
                                ),
                                value: controller.sizeType[0],
                                activeColor: AppColor.blue3,
                              ),
                              RadioListTile<String>(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
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
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                title: Text(
                                  'New files',
                                  style: AppStyles.text16sp600black2,
                                ),
                                value: controller.dateType[0],
                                activeColor: AppColor.blue3,
                              ),
                              RadioListTile<String>(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
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
        ),
      ],
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void _hideOverlayPopup() {
  _overlayEntry?.remove();
  _overlayEntry = null;
}
