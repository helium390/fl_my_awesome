import 'package:get/get.dart';

class DialogsController extends GetxController {
  static DialogsController get to => Get.find();

  DialogsController();

  bool isLoading = false;

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
