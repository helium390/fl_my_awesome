import 'dart:math' as math;

import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/services/toast_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/dividers.dart';
import '../../widgets/stackable_containers.dart';
import 'containers_controller.dart';

class CardContainersPage extends StatelessWidget {
  const CardContainersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContainersController>(
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
            title: Text('Card Containers'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StackableContainer(
                      walletPress: () {
                        ToastService.showNotifMessage('Wallet clicked!');
                      },
                      cardPress: () {
                        ToastService.showNotifMessage('Card clicked!');
                      },
                      addMoneyPress: () {
                        ToastService.showNotifMessage('Add money clicked!');
                      },
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Transform.rotate(
                            angle: -math.pi / 15,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColor.blue4,
                                // gradient: LinearGradient(
                                //   begin: Alignment.topLeft,
                                //   end: Alignment(0.8, 1),
                                //   colors: [AppColor.blue8, AppColor.blue9],
                                // ),
                              ),
                              height: 190,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 190,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 1),
                                colors: [AppColor.blue8, AppColor.blue9],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Super BANK',
                                    style: AppStyles.text14sp1h600white),
                                3.ph,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '₩ ',
                                      style: AppStyles.text22sp700white,
                                    ),
                                    Text(
                                      '750,000',
                                      style: AppStyles.text22sp700white,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '0123 4567 8910 1112',
                                      style: AppStyles.text14sp1h600white,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '04/18',
                                          style: AppStyles.text14sp1h600white,
                                        ),
                                        3.ph,
                                        Icon(
                                          Icons.credit_card,
                                          color: AppColor.white,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40.0,
                      ),
                      margin: const EdgeInsets.all(20.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColor.black.withAlpha(20),
                          width: 0.8,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.black.withAlpha(30),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outlined,
                            color: AppColor.grey1,
                            size: 50,
                          ),
                          20.ph,
                          Center(
                            child: Text(
                              'Error',
                              style: AppStyles.text20sp400black1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColor.grBorder,
                          width: 0.4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.black.withAlpha(30),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Card(
                        color: AppColor.white,
                        margin: EdgeInsets.zero,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () {
                            ToastService.showNotifMessage(
                                'Check rate card clicked!');
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Check Rate',
                                      style: AppStyles.text16sp400black,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.blue9,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                8.ph,
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Icon(Icons.flag,
                                              size: 25, color: AppColor.blue1),
                                          3.pw,
                                          Text(
                                            '1,000 KRW',
                                            style: AppStyles.text14sp600blue1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.sync_alt,
                                      size: 20,
                                      color: AppColor.blue1,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.flag,
                                              size: 25, color: AppColor.blue1),
                                          Text(
                                            '19,000 VND',
                                            style: AppStyles.text14sp600blue1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    20.ph,
                    Dividers.divider0h1tBlack(),
                    20.ph,
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
