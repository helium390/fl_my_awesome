import 'package:fl_my_awesome/config/extensions.dart';
import 'package:fl_my_awesome/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_input_formatters.dart';
import '../../widgets/close_keyboard.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/dividers.dart';
import 'formats_controller.dart';

class FormatsPage extends StatelessWidget {
  const FormatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormatsController>(
      builder: (controller) {
        return CloseKeyboardView(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColor.buttonText,
                  size: 20,
                ),
                onPressed: () => Get.back(),
              ),
              title: Text('Formats'),
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
                    Text(
                      'Phone number',
                      style: AppStyles.text15sp400black1,
                    ),
                    CustomTextField(
                      hintText: '###-####-####',
                      bgColor: AppColor.white,
                      function: (text) {
                        controller.update();
                      },
                      controller: controller.phoneController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        cellMaskFormatter,
                      ],
                    ),
                    10.ph,
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Original text: ',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              controller.phoneController.text,
                              style: AppStyles.text15sp1h600black1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Unmasked text: ',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              cellMaskFormatter
                                  .unmaskText(controller.phoneController.text),
                              style: AppStyles.text15sp1h600black1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Text(
                      'Birthday',
                      style: AppStyles.text15sp400black1,
                    ),
                    CustomTextField(
                      hintText: '####/##/##',
                      bgColor: AppColor.white,
                      function: (text) {
                        controller.update();
                      },
                      controller: controller.birthdayController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        birthMaskFormatter,
                      ],
                    ),
                    10.ph,
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Original text: ',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              controller.birthdayController.text,
                              style: AppStyles.text15sp1h600black1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Unmasked text: ',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              birthMaskFormatter.unmaskText(
                                  controller.birthdayController.text),
                              style: AppStyles.text15sp1h600black1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Text(
                      'Thousands Separator',
                      style: AppStyles.text15sp400black1,
                    ),
                    CustomTextField(
                      hintText: '1,000,000',
                      bgColor: AppColor.white,
                      function: (text) {
                        controller.update();
                      },
                      controller: controller.thousandController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        ThousandsSeparatorInputFormatter(),
                        LengthLimitingTextInputFormatter(13),
                        FilteringTextInputFormatter.allow(RegExp("[0-9,]")),
                      ],
                    ),
                    10.ph,
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Original text: ',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              controller.thousandController.text,
                              style: AppStyles.text15sp1h600black1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Unmasked text: ',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              controller
                                  .getTrim(controller.thousandController.text),
                              style: AppStyles.text15sp1h600black1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Unmasked Double text ',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              controller
                                  .getTrimToDouble(controller.thousandController.text),
                              style: AppStyles.text15sp1h600black1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Text(
                      'Limit Range',
                      style: AppStyles.text15sp400black1,
                    ),
                    CustomTextField(
                      hintText: 'Min: 5, Max: 20',
                      bgColor: AppColor.white,
                      function: (text) {
                        controller.update();
                      },
                      controller: controller.numericRangeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(13),
                        LimitRange(5, 20),
                      ],
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    CustomButton(
                      text: 'Test',
                      hPadding: 20,
                      vPadding: 16,
                      onPress: () {},
                    ),
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
