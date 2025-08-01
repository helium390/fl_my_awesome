import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class LoadingButton extends StatefulWidget {
  final Function()? onComplete;

  const LoadingButton({
    super.key,
    this.onComplete,
  });

  @override
  LoadingButtonState createState() => LoadingButtonState();
}

class LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.forward(),
      onTapUp: (_) {
        if (controller.status == AnimationStatus.forward) {
          controller.reverseDuration = const Duration(milliseconds: 1200);
          controller.reverse();
        }
        if (controller.status == AnimationStatus.completed) {
          if (widget.onComplete != null) {
            widget.onComplete!();
          }
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              border: Border.all(color: AppColor.black6, width: 2),
            ),
            width: 120,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: AppColor.white, width: 6),
              ),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  value: 1.0,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.black6),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            height: 120.0,
            width: 120.0,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              value: controller.value,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColor.accentColor),
            ),
          ),
          Icon(
            Icons.access_time_rounded,
            size: 50,
            color: AppColor.black2,
          ),
        ],
      ),
    );
  }
}
