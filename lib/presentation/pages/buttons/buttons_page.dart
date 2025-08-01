import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/services/toast_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading_button.dart';
import 'buttons_controller.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonsController>(
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
              title: Text('Buttons'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.ph,
                    CustomButton(
                      text: 'Button suffix',
                      prefix: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: const Icon(
                          Icons.access_alarm,
                          color: AppColor.yellow1,
                        ),
                      ),
                      onPress: () {
                        ToastService.showShortMessage('Add..');
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Button prefix',
                      suffix: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: const Icon(
                          Icons.done,
                          color: AppColor.yellow1,
                        ),
                      ),
                      onPress: () {},
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Button shadow',
                      elevation: 5,
                      onPress: () {},
                    ),
                    20.ph,
                    CustomButton(
                      isActive: false,
                      text: 'Button inactive',
                      onPress: () {},
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Button',
                      onPress: () {},
                      isMatchParent: false,
                    ),
                    20.ph,
                    Text(
                      'Long Press Loading Button',
                      style: AppStyles.text15sp400black1,
                    ),
                    10.ph,
                    LoadingButton(
                      onComplete: () async {
                        ToastService.showShortMessage('Button Press Complete');
                      },
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
