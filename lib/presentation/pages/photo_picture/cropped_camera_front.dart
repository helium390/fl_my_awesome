import 'dart:io';

import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import 'photo_picture_controller.dart';
import 'widgets/camera_widget.dart';
import 'widgets/overlay_front.dart';

class CroppedCameraFront extends StatelessWidget {
  const CroppedCameraFront({super.key});

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
            title: Text('Cropped Picture Page'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.ph,
                  Container(
                    width: double.infinity,
                    height: 220,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: controller.selfiePhoto.isEmpty
                        ? CameraWidget(
                            key: cameraGlobalKey,
                            isFrontCamera: true,
                            overlay: OverlayFront(
                              borderStrokeWidth: 3,
                              borderRadius: 10,
                              scanAreaSize: const Size(80, 80),
                            ),
                          )
                        : Image.file(File(controller.selfiePhoto)),
                  ),
                  20.ph,
                  controller.selfiePhoto.isEmpty
                      ? CustomButton(
                          vPadding: 16,
                          text: 'Take Photo',
                          onPress: () async {
                            String? imPath = await cameraGlobalKey.currentState
                                ?.takePictureWithExactCrop();
                            controller.setSelfiePhoto(imPath ?? "");
                          },
                        )
                      : CustomButton(
                          vPadding: 16,
                          text: 'Retake Photo',
                          onPress: () async {
                            controller.retakeSelfiePhoto();
                          },
                        ),
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
