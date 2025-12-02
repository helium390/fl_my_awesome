import 'package:get/get.dart';

import '../presentation/pages/biometric/bio_controller.dart';
import '../presentation/pages/biometric/biometrics/biometrics_controller.dart';
import '../presentation/pages/bottomsheet/bottom_sheet_controller.dart';
import '../presentation/pages/buttons/buttons_controller.dart';
import '../presentation/pages/containers/containers_controller.dart';
import '../presentation/pages/dialogs/dialogs_controller.dart';
import '../presentation/pages/drop_down/drop_down_controller.dart';
import '../presentation/pages/formats/formats_controller.dart';
import '../presentation/pages/home/home_controller.dart';
import '../presentation/pages/menu/show_menu_controller.dart';
import '../presentation/pages/passwords/password_controller.dart';
import '../presentation/pages/radio/radio_controller.dart';
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
    Get.lazyPut(() => ContainersController(), fenix: true);
    Get.lazyPut(() => RadioController(), fenix: true);
    Get.lazyPut(() => BioController(), fenix: true);
    Get.lazyPut(() => BiometricsController(), fenix: true);
    Get.lazyPut(() => FormatsController(), fenix: true);
    Get.lazyPut(() => DialogsController(), fenix: true);
    Get.lazyPut(() => DropDownController(), fenix: true);
    Get.lazyPut(() => ShowMenuController(), fenix: true);
    Get.lazyPut(() => BottomSheetController(), fenix: true);

    /// Repositories -----------------------------------------------------------
  }
}
