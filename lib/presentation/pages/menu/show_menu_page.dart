import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_button.dart';
import 'widgets/custom_menu.dart';
import 'widgets/custom_menu1.dart';
import '../../widgets/dividers.dart';
import 'show_menu_controller.dart';

class ShowMenuPage extends StatelessWidget {
  const ShowMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var popupGlobalKey = GlobalKey();
    var popupOverlayGlobalKey = GlobalKey();
    return GetBuilder<ShowMenuController>(
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
            title: Text('Show Menu Page'),
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
                    'Show Custom Menu Popup Example',
                    style: AppStyles.text16sp400black,
                  ),
                  10.ph,
                  CustomButton(
                    key: popupGlobalKey,
                    text: 'Show Menu Popup',
                    onPress: () {
                      showCustomMenuPopup(context, popupGlobalKey);
                    },
                  ),
                  10.ph,
                  CustomButton(
                    key: popupOverlayGlobalKey,
                    text: 'Show Overlay Popup',
                    onPress: () {
                      showCustomOverlayPopup(context, popupOverlayGlobalKey);
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
}
