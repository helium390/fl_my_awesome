import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../biometric/bio_page.dart';
import '../bottom_sheet/bottom_sheet_page.dart';
import '../buttons/buttons_page.dart';
import '../containers/card_containers_page.dart';
import '../containers/containers_page.dart';
import '../dialogs/dialogs_page.dart';
import '../drop_down/drop_down_page.dart';
import '../formats/formats_page.dart';
import '../menu/show_menu_page.dart';
import '../passwords/password_page.dart';
import '../photo_picture/photo_picture_page.dart';
import '../radio/radio_page.dart';
import '../test/test_page.dart';
import '../text_field/text_field_page.dart';
import '../verify/verify_page.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('AppBar Text'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.ph,
                    CustomButton(
                      text: 'Test Page',
                      onPress: () {
                        Get.to(() => TestPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Calendar / DateField',
                      onPress: () {
                        // Get.to(() => PhotoPicturePage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Photo Picture Page',
                      onPress: () {
                        Get.to(() => PhotoPicturePage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Bottom Sheet Page',
                      onPress: () {
                        Get.to(() => BottomSheetPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Menu Page',
                      onPress: () {
                        Get.to(() => ShowMenuPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Drop Down',
                      onPress: () {
                        Get.to(() => DropDownPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Dialogs',
                      onPress: () {
                        Get.to(() => DialogsPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Formats',
                      onPress: () {
                        Get.to(() => FormatsPage());
                        // Get.to(() => OnePage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Buttons',
                      onPress: () {
                        Get.to(() => ButtonsPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'TextFields',
                      onPress: () {
                        Get.to(() => TextFieldPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Passwords',
                      onPress: () {
                        Get.to(() => PasswordPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Containers',
                      onPress: () {
                        Get.to(() => ContainersPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Card Containers',
                      onPress: () {
                        Get.to(() => CardContainersPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Radio / Checkbox / Switch',
                      onPress: () {
                        Get.to(() => RadioPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'Verify page',
                      onPress: () {
                        Get.to(() => VerifyPage());
                      },
                    ),
                    20.ph,
                    CustomButton(
                      text: 'On/Off Biometric Auth',
                      onPress: () {
                        Get.to(() => BioPage());
                      },
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
