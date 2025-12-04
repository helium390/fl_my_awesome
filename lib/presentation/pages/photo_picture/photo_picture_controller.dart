import 'package:get/get.dart';

import '../../../domain/entities/photo.dart';

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

  List<Photo> somePhotoUrlList = [];
  List<String> somePhotoLocalUrlList = [];

  void addPhoto(String localUrl, String? photoUrl) {
    Photo photo = Photo(urlString: photoUrl);
    somePhotoUrlList.add(photo);
    somePhotoLocalUrlList.add(localUrl);
    update();
  }

  void removePhoto(int index) {
    somePhotoUrlList.remove(somePhotoUrlList[index]);
    somePhotoLocalUrlList.remove(somePhotoLocalUrlList[index]);
    update();
  }

  /// Id part ------------------------------------------------------------------
  String idBack = "";

  void setIdBack(String path) {
    idBack = path;
    update();
  }

  void retakeIdBack() {
    idBack = "";
    update();
  }

  String selfiePhoto = "";

  void setSelfiePhoto(String path) {
    selfiePhoto = path;
    update();
  }

  void retakeSelfiePhoto() {
    selfiePhoto = "";
    update();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
