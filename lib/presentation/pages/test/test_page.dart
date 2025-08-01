import 'package:fl_my_awesome/config/extensions.dart';
import 'package:fl_my_awesome/core/services/toast_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/loading_button.dart';
import 'test_controller.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
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
              title: Text('Test Page'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Long Press Button',
                      style: AppStyles.text18sp400black1,
                    ),
                    20.ph,
                    Center(
                      child: LoadingButton(
                        onComplete: () async {
                          ToastService.showShortMessage('Button Pressed');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
