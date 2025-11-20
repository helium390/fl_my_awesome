import 'package:fl_my_awesome/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../widgets/custom_switch.dart';
import 'bio_controller.dart';
import 'biometrics/biometrics_page.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BioController>(
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
            title: Text('Bio Page'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enable Biometric Authentication',
                        style: AppStyles.text15sp500black1,
                      ),
                      CustomSwitch(
                        value: controller.localAuth,
                        tScale: 0.8,
                        onChanged: (bool value) async {
                          if (controller.localAuth) {
                            controller.disableFingerprint();
                          } else {
                            var isAuthRes =
                                await Get.to(() => const BiometricsPage());
                            if (isAuthRes == null || isAuthRes == false) {
                              controller.setLocalAuth(false);
                            } else {
                              controller.setLocalAuth(true);
                            }
                          }
                        },
                      ),
                    ],
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
