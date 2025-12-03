import 'package:get/get.dart';

class PhotoPictureController extends GetxController {
  static PhotoPictureController get to => Get.find();

  PhotoPictureController();

  bool isLoading = false;

  String? passportImageLocal;
  String? avatarImageLocal;

  void setPassportImage(String localUrl) {
    passportImageLocal = localUrl;
    update();
  }

  void setAvatarImage(String? localUrl) {
    avatarImageLocal = localUrl;
    update();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
