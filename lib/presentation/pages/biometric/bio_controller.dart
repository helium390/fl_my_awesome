import 'package:get/get.dart';

import '../../../data/database/db_service.dart';
import '../../widgets/simple_dialog.dart';

class BioController extends GetxController {
  static BioController get to => Get.find();

  BioController();

  bool isLoading = false;

  bool localAuth = DBService.to.isLocalAuth();

  Future<void> disableFingerprint() async {
    showSimpleDialog(
      title: 'Disable biometric auth',
      body: 'Biometrics will no longer be \nsecuring you',
      leftBtnName: 'Cancel',
      rightBtnName: 'Ok',
      leftBtnFunc: () {
        Get.back();
        update();
      },
      rightBtnFunc: () {
        Get.back();
        setLocalAuth(false);
      },
    );
    update();
  }

  void setLocalAuth(bool value) {
    localAuth = value;
    DBService.to.setLocalAuth(value);
    update();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
