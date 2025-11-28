import 'package:get/get.dart';

class DropDownController extends GetxController {
  static DropDownController get to => Get.find();

  DropDownController();

  bool isLoading = false;

  final genderList = [
    'Male',
    'Female',
    'Other',
  ];

  dynamic genderType;
  void setGenderType(type) {
    genderType = type;
    update();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
