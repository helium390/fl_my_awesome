import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import 'widgets/call_stateful_bottom.dart';

class BottomSheetController extends GetxController {
  static BottomSheetController get to => Get.find();

  BottomSheetController();

  bool isLoading = false;

  /// List for Feedback --------------------------------------------------------
  void setFeedbackType(FeedbackItem item) {
    for (var feedback in feedbackTypeList) {
      feedback.selected = false;
    }
    item.selected = true;
    update();
  }

  List<FeedbackItem> feedbackTypeList = [
    FeedbackItem(
      icon: AppAssets.images.bug,
      text: 'Bug',
    ),
    FeedbackItem(
      icon: AppAssets.images.suggestion,
      text: 'Suggestion',
    ),
    FeedbackItem(
      icon: AppAssets.images.compliment,
      text: 'Compliment',
    ),
  ];

  FeedbackItem get selectedFeedbackType {
    return feedbackTypeList.firstWhere((item) => item.selected,
        orElse: () => FeedbackItem(icon: '', text: 'None'));
  }

  /// List for Rate --------------------------------------------------------
  void setRateNum(RateNumItem item) {
    for (var num in rateNumList) {
      num.selected = false;
    }
    item.selected = true;
    update();
  }

  List<RateNumItem> rateNumList = [
    RateNumItem(
      color: AppColor.red25,
      text: '1',
    ),
    RateNumItem(
      color: AppColor.red25,
      text: '2',
    ),
    RateNumItem(
      color: AppColor.red25,
      text: '3',
    ),
    RateNumItem(
      color: AppColor.red25,
      text: '4',
    ),
    RateNumItem(
      color: AppColor.red25,
      text: '5',
    ),
    RateNumItem(
      color: AppColor.red25,
      text: '6',
    ),
    RateNumItem(
      color: AppColor.yellow2,
      text: '7',
    ),
    RateNumItem(
      color: AppColor.yellow2,
      text: '8',
    ),
    RateNumItem(
      color: AppColor.green8,
      text: '9',
    ),
    RateNumItem(
      color: AppColor.green8,
      text: '10',
    ),
  ];

  RateNumItem get selectedRateNum {
    return rateNumList.firstWhere((item) => item.selected,
        orElse: () => RateNumItem(color: AppColor.red25, text: '0'));
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
