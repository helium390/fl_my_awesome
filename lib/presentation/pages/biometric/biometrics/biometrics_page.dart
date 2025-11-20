import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/extensions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../widgets/custom_button.dart';
import 'biometrics_controller.dart';

class BiometricsPage extends StatelessWidget {
  const BiometricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) {
          return;
        }
        Navigator.pop(context, false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.accentColor,
        appBar: AppBar(
          backgroundColor: AppColor.accentColor,
          automaticallyImplyLeading: false,
        ),
        body: GetBuilder<BiometricsController>(builder: (controller) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.images.fingerprint,
                          width: 100,
                          height: 100,
                        ),
                        30.ph,
                        Text(
                          'Protect Account',
                          style: AppStyles.text22sp700white,
                          textAlign: TextAlign.center,
                        ),
                        20.ph,
                        Text(
                          'Add an extra layer of security to your app.',
                          style: AppStyles.text13sp400white,
                          textAlign: TextAlign.center,
                        ),
                        150.ph,
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'Ask later',
                              bgColor: AppColor.white,
                              borderColor: AppColor.white,
                              textStyle: AppStyles.text15sp400black1,
                              onPress: () {
                                Get.back(result: false);
                              },
                            ),
                          ),
                          16.pw,
                          Expanded(
                            child: CustomButton(
                              text: 'Yes',
                              bgColor: AppColor.white,
                              borderColor: AppColor.white,
                              textStyle: AppStyles.text15sp400black1,
                              onPress: () async {
                                controller.login();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
