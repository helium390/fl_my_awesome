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
                  40.ph,
                  Text(
                    '''This page wraps the camera plugin to show a live camera preview. Provides a helper method to capture a cropped image exactly matching the visible preview area.
                    \nExposes takePictureWithExactCrop() (via a global key cameraGlobalKey) which captures a photo, computes the visible crop rectangle, crops/resizes using the image package, saves a final file, and deletes the original capture.
                    ''',
                    style: AppStyles.text14sp400black1,
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
