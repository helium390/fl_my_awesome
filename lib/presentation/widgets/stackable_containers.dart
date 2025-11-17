import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../core/utils/app_colors.dart';
import 'custom_button.dart';

class StackableContainer extends StatefulWidget {
  final VoidCallback? walletPress;
  final VoidCallback? cardPress;
  final VoidCallback? addMoneyPress;

  const StackableContainer({
    this.walletPress,
    this.cardPress,
    this.addMoneyPress,
    super.key,
  });

  @override
  State<StackableContainer> createState() => _StackableContainersState();
}

class _StackableContainersState extends State<StackableContainer> {
  bool isSecondContainerOnTop = true;
  double cardHeight = 250;
  double distanceCard = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.blue1,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.blue1, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColor.blue1.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: isSecondContainerOnTop
            ? [firstWidget(), secondWidget()]
            : [secondWidget(), firstWidget()],
      ),
    );
  }

  Widget firstWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSecondContainerOnTop = false;
        });
      },
      child: Container(
        width: double.infinity,
        height: cardHeight - distanceCard,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: [AppColor.blue2, AppColor.blue5],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Wallet', style: AppStyles.text18sp600white),
            IgnorePointer(
              ignoring: isSecondContainerOnTop,
              child: InkWell(
                onTap: widget.walletPress,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '₩ ',
                      style: AppStyles.text22sp700white,
                    ),
                    Text(
                      '750,000',
                      style: AppStyles.text32sp600white,
                    ),
                    10.pw,
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            Text('Current balance', style: AppStyles.text12sp300white),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: IgnorePointer(
                ignoring: isSecondContainerOnTop,
                child: CustomButton(
                  isMatchParent: false,
                  text: 'Add money',
                  bgColor: AppColor.white,
                  vPadding: 6,
                  elevation: 5,
                  textStyle: AppStyles.text13sp600blue3,
                  suffix: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Icon(
                      Icons.add_circle_outline,
                      color: AppColor.blue3,
                    ),
                  ),
                  onPress: widget.addMoneyPress,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget secondWidget() {
    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          isSecondContainerOnTop = true;
        });
      },
      child: Container(
        width: double.infinity,
        height: cardHeight - distanceCard,
        margin: EdgeInsets.only(top: distanceCard),
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
            Text('Card', style: AppStyles.text18sp600white),
            IgnorePointer(
              ignoring: !isSecondContainerOnTop,
              child: InkWell(
                // onTap: () {
                //   ToastService.showNotifMessage('JRF Card Money clicked');
                // },
                onTap: widget.cardPress,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '₩ ',
                      style: AppStyles.text22sp700white,
                    ),
                    Text(
                      '750,000',
                      style: AppStyles.text32sp600white,
                    ),
                    10.pw,
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            Text('Current Balance', style: AppStyles.text12sp300white),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '0123 4567 8910 1112',
                  style: AppStyles.text13sp400white,
                ),
                Column(
                  children: [
                    Text(
                      '04/18',
                      style: AppStyles.text13sp400white,
                    ),
                    3.ph,
                    Icon(
                      Icons.credit_card,
                      color: AppColor.white,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
