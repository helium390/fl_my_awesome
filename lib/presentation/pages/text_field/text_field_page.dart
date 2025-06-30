import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'text_field_controller.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
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
              title: Text('TextField'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.ph,
                    CustomTextField(
                      hintText: 'id'.tr,
                      function: (text) {
                        // controller.activateButton();
                      },
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                      ],
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Button shadow',
                      elevation: 5,
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
