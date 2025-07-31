import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/dividers.dart';
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CustomTextField',
                      style: AppStyles.text16sp600black2,
                    ),
                    10.ph,
                    CustomTextField(
                      hintText: 'Bg Color Change',
                      bgValueColor: AppColor.white,
                      function: (text) {},
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      inputFormatters: [],
                    ),
                    10.ph,
                    CustomTextField(
                      hintText: 'Bg Color Change',
                      bgColor: AppColor.white,
                      function: (text) {},
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      inputFormatters: [],
                    ),
                    10.ph,
                    CustomTextField(
                      hintText: 'Password',
                      controller: TextEditingController(),
                      bgColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      function: (text) {},
                    ),
                    10.ph,
                    CustomTextField(
                      hintText: 'Password (show/hide)',
                      controller: TextEditingController(),
                      bgColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      obscureIconVisible: true,
                      function: (text) {},
                    ),
                    10.ph,
                    CustomTextField(
                      title: 'Title text',
                      titleBottomPadding: 5,
                      hintText: 'Title',
                      controller: TextEditingController(),
                      bgColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      function: (text) {},
                    ),
                    10.ph,
                    CustomTextField(
                      titleBottomPadding: 5,
                      hintText: 'Error Text',
                      controller: TextEditingController(),
                      bgColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      errorTopPadding: 2,
                      function: (text) {},
                      errorText: 'Error Text',
                    ),
                    10.ph,
                    CustomTextField(
                      hintText: 'No Error Text',
                      controller: TextEditingController(),
                      bgColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      errorTopPadding: 2,
                      function: (text) {},
                      noErrorText: 'No Error Text',
                    ),
                    20.ph,
                    Dividers.divider0h05t02black02(),
                    20.ph,
                    Text(
                      'CustomTextFormField',
                      style: AppStyles.text16sp600black2,
                    ),
                    10.ph,
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      obscureColor: AppColor.red1,
                      function: (text) {},
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Button',
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
