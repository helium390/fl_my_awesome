import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  static const String id = "/splash_page";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColor.white,
            child: Center(
              child: Text('Change to image', style: AppStyles.text18sp500black1,),
              // child: Image.asset(
              //   AppAssets.images.splash,
              //   height: 80,
              // ),
            ),
          );
        },
      ),
    );
  }
}
