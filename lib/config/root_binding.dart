import 'package:get/get.dart';

import '../presentation/pages/home/home_controller.dart';
import '../presentation/pages/splash/splash_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    /// Controllers ------------------------------------------------------------
    Get.lazyPut(() => SplashController(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true);

    /// Repositories -----------------------------------------------------------
  }
}
