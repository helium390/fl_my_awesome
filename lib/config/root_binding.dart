import 'package:get/get.dart';

import '../presentation/pages/buttons/buttons_controller.dart';
import '../presentation/pages/home/home_controller.dart';
import '../presentation/pages/passwords/password_controller.dart';
import '../presentation/pages/splash/splash_controller.dart';
import '../presentation/pages/test/test_controller.dart';
import '../presentation/pages/text_field/text_field_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    /// Controllers ------------------------------------------------------------
    Get.lazyPut(() => SplashController(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ButtonsController(), fenix: true);
    Get.lazyPut(() => TextFieldController(), fenix: true);
    Get.lazyPut(() => PasswordController(), fenix: true);
    Get.lazyPut(() => TestController(), fenix: true);

    /// Repositories -----------------------------------------------------------
  }
}
