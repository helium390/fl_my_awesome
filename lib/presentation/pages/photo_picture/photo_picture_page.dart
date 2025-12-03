import 'dart:io';

import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import 'image_util/select_custom_img.dart';
import 'image_util/select_image.dart';
import 'photo_picture_controller.dart';
import '../../widgets/dividers.dart';

class PhotoPicturePage extends StatelessWidget {
  const PhotoPicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhotoPictureController>(
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
            title: Text('Photo Picture Page'),
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
                    'Select Image with ready widget',
                    style: AppStyles.text16sp400black,
                  ),
                  20.ph,
                  SizedBox(
                    width: 100,
                    child: SelectImage(
                      image: controller.avatarImageLocal,
                      // placeHolder: AppAssets.icons.imgAdd,
                      imgWidth: 28,
                      imgHeight: 28,
                      imageFunction: (localUrl, imageUrl) {
                        controller.setAvatarImage(localUrl);
                      },
                    ),
                  ),
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                  Text(
                    'Select Image with custom widget',
                    style: AppStyles.text16sp400black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: controller.passportImageLocal == null
                          ? Image.asset(
                              AppAssets.images.passport,
                              height: 200,
                            )
                          : Container(
                              height: 200,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(controller.passportImageLocal ?? ""),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                  SelectCustomImg(
                    imageFunction: (localUrl, imageUrl) {
                      controller.setPassportImage(localUrl!);
                    },
                    childWidget: selectImageWidget(),
                  ),
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                  CustomButton(
                    text: 'Update Controller',
                    onPress: () {
                      controller.update();
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

  Widget selectImageWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.grBorder,
          width: 0.4,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withAlpha(30),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: 28,
            color: AppColor.blue3,
          ),
          10.pw,
          Expanded(
            child: Text(
              'Scan or upload document',
              style: AppStyles.text15sp500black1,
            ),
          ),
          10.pw,
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
            color: AppColor.blue3,
          ),
        ],
      ),
    );
  }
}
