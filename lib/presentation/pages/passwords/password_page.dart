import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'password_controller.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(
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
            title: Text('Password Check'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password Check',
                    style: AppStyles.text16sp600black2,
                  ),
                  10.ph,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: 'Password',
                        controller: controller.passwordController,
                        bgColor: AppColor.white,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        function: (text) {
                          controller.checkPassword();
                        },
                      ),
                      10.ph,
                      Row(
                        children: [
                          SvgPicture.asset(
                            controller.eightCharacters
                                ? AppAssets.icons.verifyOk
                                : AppAssets.icons.verifyNo,
                            width: 18,
                          ),
                          8.pw,
                          Text(
                            'Enter at least 8 characters',
                            style: controller.eightCharacters
                                ? AppStyles.text15sp400blue1
                                : AppStyles.text15sp400black1,
                          ),
                        ],
                      ),
                      4.ph,
                      Row(
                        children: [
                          SvgPicture.asset(
                            controller.oneSpecialChar
                                ? AppAssets.icons.verifyOk
                                : AppAssets.icons.verifyNo,
                            width: 18,
                          ),
                          8.pw,
                          Text(
                            'At least 1 special character (e.g. @, !, %, etc.)',
                            style: controller.oneSpecialChar
                                ? AppStyles.text15sp400blue1
                                : AppStyles.text15sp400black1,
                          ),
                        ],
                      ),
                      4.ph,
                      Row(
                        children: [
                          SvgPicture.asset(
                            controller.oneUppercase
                                ? AppAssets.icons.verifyOk
                                : AppAssets.icons.verifyNo,
                            width: 18,
                          ),
                          8.pw,
                          Text(
                            'At least 1 uppercase letter',
                            style: controller.oneUppercase
                                ? AppStyles.text15sp400blue1
                                : AppStyles.text15sp400black1,
                          ),
                        ],
                      ),
                      4.ph,
                      Row(
                        children: [
                          SvgPicture.asset(
                            controller.oneDigit
                                ? AppAssets.icons.verifyOk
                                : AppAssets.icons.verifyNo,
                            width: 18,
                          ),
                          8.pw,
                          Text(
                            'At least 1 digit',
                            style: controller.oneDigit
                                ? AppStyles.text15sp400blue1
                                : AppStyles.text15sp400black1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.ph,
                  CustomButton(
                    text: 'Button',
                    isActive: controller.buttonActive,
                    vPadding: 16,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
