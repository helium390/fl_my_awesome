import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_checkbox.dart';
import '../../widgets/dividers.dart';
import 'radio_controller.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RadioController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColor.buttonText,
                size: 20,
              ),
              onPressed: () => Get.back(),
            ),
            title: Text('Radio / Checkbox'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Container(
                      transform: Matrix4.translationValues(-10.0, -10.0, 0.0),
                      child: RadioGroup<String>(
                        groupValue: controller.selectedOption,
                        onChanged: (value) {
                          controller.setOption(value);
                        },
                        child: Column(
                          children: [
                            Text(
                              'Selected Option: ${controller.selectedOption}',
                              style: AppStyles.text16sp400black,
                            ),
                            10.ph,
                            RadioListTile<String>(
                              title: Text(
                                'Option 1',
                                style: AppStyles.text16sp400black,
                              ),
                              value: controller.optionType[0],
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              activeColor: AppColor.blue3,
                            ),
                            RadioListTile<String>(
                              title: Text(
                                'Option 2',
                                style: AppStyles.text16sp400black,
                              ),
                              value: controller.optionType[1],
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              activeColor: AppColor.blue3,
                            ),
                            10.ph,
                            RadioListTile<String>(
                              title: Align(
                                alignment: Alignment(-1.1, 0),
                                child: Text(
                                  'Option 3',
                                  style: AppStyles.text16sp400black,
                                ),
                              ),
                              value: controller.optionType[2],
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              activeColor: AppColor.blue3,
                            ),
                            RadioListTile<String>(
                              title: Transform.translate(
                                offset: Offset(-10, 0),
                                child: Text(
                                  'Option 4',
                                  style: AppStyles.text16sp400black,
                                ),
                              ),
                              value: controller.optionType[3],
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              activeColor: AppColor.blue3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.ph,
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
                        transform: Matrix4.translationValues(-10.0, -10.0, 0.0),
                        child: RadioGroup<String>(
                          groupValue: controller.selectedChoice,
                          onChanged: (value) {
                            controller.setChoice(value);
                          },
                          child: Column(
                            children: [
                              Text(
                                'Selected Option: ${controller.selectedChoice}',
                                style: AppStyles.text16sp400black,
                              ),
                              10.ph,
                              RadioListTile<String>(
                                title: Text(
                                  'Choice 1',
                                  style: AppStyles.text16sp400black,
                                ),
                                value: controller.choiceList[0],
                                activeColor: AppColor.blue3,
                              ),
                              RadioListTile<String>(
                                title: Text(
                                  'Choice 2',
                                  style: AppStyles.text16sp400black,
                                ),
                                value: controller.choiceList[1],
                                activeColor: AppColor.blue3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Center(
                      child: Text(
                        'Simple Checkbox',
                        style: AppStyles.text16sp400black,
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                        value: controller.check1,
                        onChanged: (val) {
                          controller.setCheck1(val ?? false);
                        },
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Center(
                      child: Text(
                        'Labeled Checkbox',
                        style: AppStyles.text16sp400black,
                      ),
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
                        transform: Matrix4.translationValues(-10.0, -10.0, 0.0),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: Text(
                                'Labeled Checkbox 2',
                                style: AppStyles.text14sp400black1,
                              ),
                              value: controller.check2,
                              onChanged: (val) {
                                controller.setCheck2(val ?? false);
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                            CheckboxListTile(
                              title: Text(
                                'Labeled Checkbox 3',
                                style: AppStyles.text14sp400black1,
                              ),
                              value: controller.check3,
                              onChanged: (val) {
                                controller.setCheck3(val ?? false);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Center(
                      child: Text(
                        'Custom Checkbox',
                        style: AppStyles.text16sp400black,
                      ),
                    ),
                    10.ph,
                    CustomCheckbox(
                      checked: controller.termsCondition,
                      function: () {
                        controller.checkTermsCondition();
                      },
                    ),
                    10.ph,
                    CustomCheckbox(
                      checked: controller.termsCondition,
                      function: () {
                        controller.checkTermsCondition();
                      },
                      borderRadius: 7,
                      borderWidth: 1.5,
                      checkedBorderColor: AppColor.green1,
                      checkedFillColor: AppColor.green1,
                      uncheckedBorderColor: AppColor.green1,
                      uncheckedFillColor: AppColor.white,
                      childIcon: Center(
                        child: Icon(
                          Icons.radio_button_checked_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
