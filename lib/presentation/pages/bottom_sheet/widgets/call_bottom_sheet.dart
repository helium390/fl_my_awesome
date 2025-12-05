import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/extensions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

void callBottomSheet({
  required final BuildContext context,
  required final List items,
  required Function(String value)? onSelect,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColor.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
    ),
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.icons.drag,
                  width: 32,
                ),
              ),
            ),
            15.ph,
            Flexible(
              child: ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          if (onSelect != null) {
                            onSelect(items[index]);
                          }
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 30.0,
                            top: 7,
                            bottom: 7,
                          ),
                          child: Text(
                            items[index].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.text16sp400dark04,
                          ),
                        ),
                      ),
                      if (index == items.length - 1)
                        Column(
                          children: [
                            10.ph,
                            Divider(
                              height: 0,
                              color: AppColor.black.withValues(alpha: 0.1),
                              thickness: 1,
                            ),
                            10.ph,
                            RichText(
                              text: TextSpan(
                                style: AppStyles.text16sp600red1,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Close',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        }),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
