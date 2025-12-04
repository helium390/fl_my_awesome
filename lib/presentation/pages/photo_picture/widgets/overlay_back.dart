import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../config/extensions.dart';

class OverlayBack extends StatelessWidget {
  const OverlayBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: AppColor.black.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 80,
              child: AspectRatio(
                aspectRatio: 1.586,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColor.white, width: 1.5),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: AppColor.white, width: 1),
                        ),
                        margin: const EdgeInsets.all(10),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 50,
                          margin: const EdgeInsets.only(right: 10),
                          height: 1,
                          color: AppColor.white,
                        ),
                      ),
                      10.ph,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 50,
                          margin: const EdgeInsets.only(right: 10),
                          height: 1,
                          color: AppColor.white,
                        ),
                      ),
                      10.ph,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Take a picture of the back of your ID',
                style: AppStyles.text16sp400white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
