import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/services/toast_service.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import 'bottom_sheet_controller.dart';
import '../../widgets/dividers.dart';
import 'widgets/call_bottom_sheet.dart';
import 'widgets/call_stateful_bottom.dart';

class BottomSheetPage extends StatelessWidget {
  BottomSheetPage({super.key});

  final _mList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetController>(
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
            title: Text('Bottom Sheet Page'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                  Text(
                    'This is Bottom Sheet Page',
                    style: AppStyles.text16sp400black,
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Show Bottom Sheet',
                    onPress: () {
                      showModal(
                        context,
                        (value) {
                          ToastService.showNotifMessage('Clicked: $value');
                        },
                      );
                    },
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Bottom Sheet with List',
                    onPress: () {
                      callBottomSheet(
                        context: context,
                        items: _mList,
                        onSelect: (value) {
                          ToastService.showNotifMessage('Clicked: $value');
                        },
                      );
                    },
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Stateful Bottom Sheet',
                    onPress: () {
                      callStatefulBottom(
                        context: context,
                        fItems: controller.feedbackTypeList,
                        rateNumItem: controller.rateNumList,
                        onSelect: (item) {
                          controller.setFeedbackType(item);
                        },
                        onRate: (item) {
                          controller.setRateNum(item);
                        },
                        onSubmit: () {
                          ToastService.showNotifMessage(
                            'Feedback Type: ${controller.selectedFeedbackType.text}, Rate: ${controller.selectedRateNum.text}',
                          );
                        },
                      );
                    },
                  ),
                  10.ph,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showModal(
    final BuildContext context,
    Function(String value)? onOkClick,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 20,
            right: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.icons.drag,
                    width: 32,
                  ),
                ),
              ),
              5.ph,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Header Title',
                      textAlign: TextAlign.left,
                      style: AppStyles.text18sp700dark04,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 24,
                      color: AppColor.black,
                    ),
                  )
                ],
              ),
              5.ph,
              Divider(
                height: 0,
                color: AppColor.black.withValues(alpha: 0.1),
                thickness: 1,
              ),
              Column(
                children: [
                  20.ph,
                  CustomButton(
                    text: 'Some Action 1',
                    onPress: () {
                      if (onOkClick != null) {
                        onOkClick('Value 1');
                      }
                      Navigator.pop(context);
                    },
                  ),
                  30.ph,
                  Text(
                    'Some text between actions',
                    style: AppStyles.text16sp400black,
                  ),
                  30.ph,
                  CustomButton(
                    text: 'Some Action 2',
                    onPress: () {
                      if (onOkClick != null) {
                        onOkClick('Value 2');
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  10.ph,
                  Divider(
                    height: 0,
                    color: AppColor.black.withValues(alpha: 0.1),
                    thickness: 1,
                  ),
                  10.ph,
                  RichText(
                    text: TextSpan(
                      style: AppStyles.text16sp600red1,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Close',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              }),
                      ],
                    ),
                  ),
                  10.ph,
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
