import 'package:get/get.dart';

import '../home/home_page.dart';

class SplashController extends GetxController {
  SplashController();

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    checkIfLoggedIn();
  }

  /// Loading ------------------------------------------------------------------
  void checkIfLoggedIn() {
    Future.delayed(const Duration(seconds: 2), () {
      checkSession();
    });
  }

  /// Check App Version --------------------------------------------------------
  void checkSession() async {
    Get.off(() => const HomePage());
  }
}
