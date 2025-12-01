import 'package:get/get.dart';

class ShowMenuController extends GetxController {
  static ShowMenuController get to => Get.find();

  ShowMenuController();

  bool isLoading = false;

  final List sizeType = [
    'small',
    'large',
  ];

  String selectedSizeType = 'small';

  void setSizeType(String type) {
    selectedSizeType = type;
    update();
  }

  final List dateType = [
    'new',
    'old',
  ];

  String selectedDateType = 'new';

  void setDateType(String type) {
    selectedDateType = type;
    update();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
