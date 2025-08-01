import 'package:get/get.dart';

class TestController extends GetxController {
  static TestController get to => Get.find();

  TestController();

  bool isLoading = false;

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
