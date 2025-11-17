import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

//ignore: must_be_immutable
class OtpNum extends StatelessWidget {
  final String text;

  const OtpNum({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyles.text36sp400black,
        ),
      ),
    );
  }
}
