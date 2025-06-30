import 'package:get/get.dart';

class ButtonsController extends GetxController {
  static ButtonsController get to => Get.find();

  ButtonsController();

  bool isLoading = false;

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
