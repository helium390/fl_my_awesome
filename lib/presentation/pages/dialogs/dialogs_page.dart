import 'dart:ui';

import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/services/toast_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_form_dialog.dart';
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
                    'Custom Form Dialog Example',
                    style: AppStyles.text16sp400black,
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Custom Form Dialog',
                    onPress: () {
                      showCustomFormDialog(
                        barrierDismissible: false,
                        closeButton: true,
                        context: context,
                        title: 'Title - Lorem Ipsum',
                        leftBtnName: 'Cancel',
                        rightBtnName: 'Save',
                        leftBtnFunc: () {
                          Get.back();
                        },
                        rightBtnFunc: (data) async {
                          Get.back();
                          ToastService.showNotifMessage(data.toString());
                        },
                      );
                    },
                  ),
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                  Text(
                    'Custom Dialog Examples',
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
                  Text(
                    'Flutter Built-in Dialog Examples',
                    style: AppStyles.text16sp400black,
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Cupertino Alert Dialog',
                    onPress: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text('Alert'),
                            content: const Text(
                                'This is a Cupertino-style alert dialog.'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Dialog - Fullscreen',
                    onPress: () {
                      showDialog<String>(
                        context: context,
                        useSafeArea: false,
                        builder: (BuildContext context) => Dialog.fullscreen(
                          semanticsRole: SemanticsRole.none,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('This is a fullscreen dialog.'),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  10.ph,
                  CustomButton(
                    text: 'Dialog - Simple Alert',
                    onPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('AlertDialog Title'),
                          content: const Text('AlertDialog description'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
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
