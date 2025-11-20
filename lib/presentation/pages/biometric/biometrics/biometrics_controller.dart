import 'package:get/get.dart';

import '../../../../core/services/toast_service.dart';
import 'local_auth_service.dart';

class BiometricsController extends GetxController {
  static BiometricsController get to => Get.find();

  BiometricsController();

  bool isLoading = false;

  /// Login --------------------------------------------------------------------
  void login() async {
    changeLoading();
    final auth = await LocalAuth.authenticate();
    if (auth) {
      Get.back(result: true);
    } else {
      Get.back(result: false);
      ToastService.showLongMessage('Authentication canceled');
    }
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
