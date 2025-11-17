import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/services/toast_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/circle_progress.dart';
import '../../widgets/dividers.dart';
import '../../widgets/loading_button.dart';
import 'containers_controller.dart';

class ContainersPage extends StatelessWidget {
  const ContainersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContainersController>(
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
            title: Text('Containers'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                          child: CircleAvatar(
                            minRadius: 30,
                            backgroundColor: AppColor.red2,
                            child: CircleAvatar(
                              minRadius: 28,
                              backgroundColor: AppColor.white,
                              child: CircleAvatar(
                                minRadius: 26,
                                backgroundColor: AppColor.red2,
                                child: Text(
                                  'DR',
                                  style: AppStyles.text18sp500black1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.pw,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dilshod Rakhmanov',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.text20sp400black1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Member ID',
                                    style: AppStyles.text14sp500grey1h1,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ': Member030785',
                                      style: AppStyles.text14sp500grey1h1,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    CustomPaint(
                      painter: CircleProgress(
                        currentProgress: 84.12,
                        color: AppColor.green1,
                        bgColor: AppColor.grey1,
                        strokeWidth: 10,
                        isPoint: false,
                      ),
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '84.12 %',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              'remaining',
                              style: AppStyles.text15sp400black1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    CustomPaint(
                      painter: CircleProgress(
                        currentProgress: 45,
                        color: AppColor.green1,
                        bgColor: AppColor.grey1,
                        strokeWidth: 16,
                        isPoint: true,
                      ),
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '55 %',
                              style: AppStyles.text15sp400black1,
                            ),
                            Text(
                              'remaining',
                              style: AppStyles.text15sp400black1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Text(
                      'Long Press Button',
                      style: AppStyles.text18sp400black1,
                    ),
                    20.ph,
                    LoadingButton(
                      onComplete: () async {
                        ToastService.showShortMessage('Button Pressed');
                      },
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    30.ph,
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(20),
                          // Adjust padding for content
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Bank name',
                                      style: AppStyles.text16sp400black2,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Jimi Bank',
                                      style: AppStyles.text16sp600blue1,
                                    ),
                                  ),
                                ],
                              ),
                              10.ph,
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Account',
                                      style: AppStyles.text16sp400black2,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '1234 5678 9012',
                                      style: AppStyles.text16sp600blue1,
                                    ),
                                  ),
                                ],
                              ),
                              10.ph,
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Holder',
                                      style: AppStyles.text16sp400black2,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Jimi',
                                      style: AppStyles.text16sp600blue1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: -10,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Account',
                                style: AppStyles.text16sp400black,
                              ),
                            ),
                          ),
                        ),
                      ],
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
