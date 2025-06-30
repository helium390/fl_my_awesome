import 'package:get/get.dart';

class TextFieldController extends GetxController {
  static TextFieldController get to => Get.find();

  TextFieldController();

  bool isLoading = false;

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
