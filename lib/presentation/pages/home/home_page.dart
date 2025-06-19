import 'package:fl_my_awesome/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Some Text',
                    style: AppStyles.text18sp700black1,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
