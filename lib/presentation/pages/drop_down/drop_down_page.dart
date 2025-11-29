import 'package:fl_my_awesome/config/extensions.dart';
import 'package:fl_my_awesome/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/services/toast_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/dividers.dart';
import '../../widgets/drop_down_menu.dart';
import 'drop_down_controller.dart';

class DropDownPage extends StatelessWidget {
  const DropDownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropDownController>(
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
            title: Text('Drop Down Page'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                  Center(
                    child: Text(
                      'DropDownMenu',
                      style: AppStyles.text16sp400black,
                    ),
                  ),
                  10.ph,
                  DropDownMenu(
                    isExpanded: true,
                    value: controller.genderType,
                    hintText: 'Male / Female',
                    items: controller.genderList,
                    onSelect: (value) {
                      controller.setGenderType(value);
                    },
                  ),
                  10.ph,
                  Text(
                    'Selected menu: ${controller.genderType}',
                    style: AppStyles.text16sp400black,
                  ),
                  20.ph,
                  DropDownMenu(
                    value: controller.genderType,
                    hintText: 'Male / Female',
                    items: controller.genderList,
                    onSelect: (value) {
                      controller.setGenderType(value);
                    },
                  ),
                  10.ph,
                  Text(
                    'Selected menu: ${controller.genderType}',
                    style: AppStyles.text16sp400black,
                  ),
                  20.ph,
                  Dividers.divider0h1tBlack(),
                  20.ph,
                  Center(
                    child: Text(
                      'CustomDropDownView',
                      style: AppStyles.text16sp400black,
                    ),
                  ),
                  10.ph,
                  CustomDropDownView(
                    title: "Title",
                    body: controller.user.name!,
                    titleInDropDown: "Title in Drop Down",
                    items:
                        controller.userList.map((e) => e.name ?? "").toList(),
                    onSelect: (name) {
                      controller.setUser(name);
                      ToastService.showNotifMessage(
                          'Selected user id: ${controller.user.id}');
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
