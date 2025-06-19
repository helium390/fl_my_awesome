import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  HomeController();

  bool isLoading = false;

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
