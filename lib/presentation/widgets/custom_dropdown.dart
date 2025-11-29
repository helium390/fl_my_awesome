import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../config/extensions.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/dimens.dart';

// ignore_for_file: must_be_immutable
class CustomDropDownView extends StatefulWidget {
  String? title;
  String body;
  final String titleInDropDown;
  final Function(String value)? onSelect;
  final List<String> items;

  CustomDropDownView({
    super.key,
    this.title,
    this.body = '',
    this.onSelect,
    this.titleInDropDown = '',
    this.items = const [],
  });

  @override
  State<CustomDropDownView> createState() => _CustomDropDownViewState();
}

class _CustomDropDownViewState extends State<CustomDropDownView> {
  void close() => Navigator.pop(context);

  void onSelected(int index) {
    widget.body = widget.items[index];
    if (widget.onSelect != null) {
      widget.onSelect!(widget.items[index]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title != null,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(
              widget.title ?? "",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            var result =
                await getDialog(widget.titleInDropDown, context, widget.items);
            if (result != null) onSelected(result);
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(color: AppColor.hintColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.body,
                  style: AppStyles.text16sp400black3,
                ),
                SvgPicture.asset(AppAssets.icons.dropdown),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Future<int?> getDialog(
  String titleInDropDown,
  BuildContext context,
  List<String> items,
) async {
  var result = await Get.dialog(
      Center(
        child: Container(
          width: 0.9.sw,
          decoration: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.circular(Dimens.borderRadius * 2)),
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.ph,
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 0.6.sh),
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        left: 28.0.w, right: 28.w, bottom: 20.h),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.back(result: index);
                        },
                        child: Container(
                          height: 45.h,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 11.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.borderColorWithoutOpacity
                                      .withAlpha(50),
                                  width: 1),
                              borderRadius:
                                  BorderRadius.circular(Dimens.borderRadius)),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            items[index],
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColor.white,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      transitionDuration: const Duration(milliseconds: 200));

  return result;
}
