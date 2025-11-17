import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../buttons/buttons_page.dart';
import '../containers/card_containers_page.dart';
import '../containers/containers_page.dart';
import '../passwords/password_page.dart';
import '../test/test_page.dart';
import '../text_field/text_field_page.dart';
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
            body: SingleChildScrollView(
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
                  ],
                ),
              ),
            ));
      },
    );
  }
}
