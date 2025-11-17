import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

//ignore: must_be_immutable
class NumButton extends StatelessWidget {
  final String text;
  final void Function(String num)? onPress;

  const NumButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            // minimumSize: const Size(double.infinity, 1),
            // fixedSize:const Size(double.infinity, 100),
            backgroundColor: AppColor.white,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(color: Colors.transparent)),
        onPressed: () {
          // function('dd');
          onPress?.call(text);
        },
        child: Text(
          text,
          style: AppStyles.text20sp400black1,
        ),
      ),
    );
  }
}
