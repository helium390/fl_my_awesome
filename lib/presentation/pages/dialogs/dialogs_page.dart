import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dividers.dart';
import '../../widgets/custom_dialog.dart';
import 'dialogs_controller.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DialogsController>(
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
            title: Text('Dialogs Page'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                  Text(
                    'Simple Dialog',
                    style: AppStyles.text16sp400black,
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Dialog - Two Button',
                    onPress: () {
                      showCustomDialog(
                        title: 'Title - Lorem Ipsum',
                        body:
                            'Body text goes here. \n Lorem ipsum dolor sit amet.',
                        leftBtnName: 'Cancel',
                        rightBtnName: 'Ok',
                        leftBtnFunc: () {
                          Get.back();
                        },
                        rightBtnFunc: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Dialog - One Button',
                    onPress: () {
                      showCustomDialog(
                        title: 'Title without body',
                        rightBtnName: 'Ok',
                        rightBtnFunc: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Dialog - Custom Body',
                    onPress: () {
                      showCustomDialog(
                        title: 'Title - Lorem Ipsum',
                        body:
                            'Body text goes here. \n Lorem ipsum dolor sit amet.',
                        customBody: Icon(
                          Icons.image,
                          size: 80,
                          color: AppColor.green1,
                        ),
                        leftBtnName: 'Cancel',
                        rightBtnName: 'Ok',
                        leftBtnFunc: () {
                          Get.back();
                        },
                        rightBtnFunc: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Dialog - Close Icon (Dismissible: false)',
                    onPress: () {
                      showCustomDialog(
                        closeButton: true,
                        barrierDismissible: false,
                        title: 'Title - Lorem Ipsum',
                        body:
                            'Body text goes here. \n Lorem ipsum dolor sit amet.',
                        leftBtnName: 'Cancel',
                        rightBtnName: 'Ok',
                        leftBtnFunc: () {
                          Get.back();
                        },
                        rightBtnFunc: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
