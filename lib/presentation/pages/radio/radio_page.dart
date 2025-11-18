import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
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
            title: Text('Radio Buttons'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
