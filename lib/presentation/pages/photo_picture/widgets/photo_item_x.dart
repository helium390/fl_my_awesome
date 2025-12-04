import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class PhotoItemX extends StatelessWidget {
  final String image;
  final VoidCallback onRemove;

  const PhotoItemX({
    super.key,
    required this.image,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(
                            color: AppColor.listDividerColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        image,
                        height: 40,
                        width: 40,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: onRemove,
            child: ClipOval(
              child: Container(
                width: 18,
                height: 18,
                color: AppColor.grayRound,
                child: const Icon(
                  Icons.close,
                  color: AppColor.white,
                  size: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
