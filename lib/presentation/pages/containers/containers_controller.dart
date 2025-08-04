import 'package:get/get.dart';

class ContainersController extends GetxController {
  static ContainersController get to => Get.find();

  ContainersController();

  bool isLoading = false;

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
