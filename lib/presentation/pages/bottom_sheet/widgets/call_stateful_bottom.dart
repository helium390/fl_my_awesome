import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/extensions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../widgets/custom_button.dart';

void callStatefulBottom({
  required final BuildContext context,
  required final List<RateNumItem> rateNumItem,
  required final List<FeedbackItem> fItems,
  required Function(RateNumItem item)? onRate,
  required Function(FeedbackItem item)? onSelect,
  required Function onSubmit,
  bool rateNum = false,
  bool feedType = false,
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
      return StatefulBuilder(builder: (
        BuildContext context,
        StateSetter setState,
      ) {
        return Container(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: SvgPicture.asset(AppAssets.icons.drag, width: 32),
                ),
              ),
              20.ph,
              Text(
                'Your opinion',
                style: AppStyles.text18sp700dark05,
              ),
              20.ph,
              Text(
                'Opinion details',
                style: AppStyles.text16sp400dark05,
              ),
              20.ph,
              SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: rateNumItem.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          onRate!(rateNumItem[index]);
                          if (rateNumItem[index].selected) {
                            rateNum = true;
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 33,
                            decoration: BoxDecoration(
                              color: rateNumItem[index].color,
                              borderRadius: BorderRadius.circular(4),
                              border: rateNumItem[index].selected
                                  ? Border.all(
                                      color: AppColor.red11, width: 2.5)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                rateNumItem[index].text,
                                style: AppStyles.text16sp700white,
                              ),
                            ),
                          ),
                          5.pw,
                        ],
                      ),
                    );
                  },
                ),
              ),
              20.ph,
              Flexible(
                child: ListView.builder(
                  itemCount: fItems.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          onSelect!(fItems[index]);
                          if (fItems[index].selected) {
                            feedType = true;
                          }
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: fItems[index].selected
                                  ? AppColor.green7
                                  : AppColor.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: fItems[index].selected
                                      ? AppColor.green2
                                      : AppColor.grayBorder,
                                  width: 1),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  fItems[index].icon,
                                  height: 24,
                                ),
                                10.pw,
                                Expanded(
                                  child: Text(
                                    fItems[index].text,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.text16sp400dark04,
                                  ),
                                ),
                                10.pw,
                                fItems[index].selected
                                    ? SvgPicture.asset(
                                        AppAssets.icons.check1,
                                        width: 24,
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          14.ph,
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Comment',
                style: AppStyles.text16sp400dark05,
              ),
              10.ph,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.grayBorder, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  buildCounter: (
                    context, {
                    required currentLength,
                    required isFocused,
                    maxLength,
                  }) =>
                      null,
                  controller: TextEditingController(),
                  maxLength: 200,
                  maxLines: 4,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type here',
                    hintStyle: const TextStyle(color: AppColor.dark05),
                  ),
                ),
              ),
              20.ph,
              Center(
                child: CustomButton(
                  vPadding: 12,
                  hPadding: 50,
                  text: 'Submit',
                  isActive: (rateNum == true && feedType == true),
                  onPress: () {
                    onSubmit();
                    Navigator.pop(context);
                  },
                ),
              ),
              20.ph,
            ],
          ),
        );
      });
    },
  );
}

class RateNumItem {
  final Color color;
  final String text;
  bool selected;

  RateNumItem({
    required this.color,
    required this.text,
    this.selected = false,
  });
}

class FeedbackItem {
  final String icon;
  final String text;
  bool selected;

  FeedbackItem({
    required this.icon,
    required this.text,
    this.selected = false,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) => FeedbackItem(
        icon: json["icon"],
        text: json["text"],
        selected: json["selected"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "text": text,
        "selected": selected,
      };
}
