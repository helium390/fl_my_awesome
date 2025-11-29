import 'package:get/get.dart';

import 'user.dart';

class DropDownController extends GetxController {
  static DropDownController get to => Get.find();

  DropDownController();

  bool isLoading = false;

  final genderList = [
    'Male',
    'Female',
    'Other',
  ];

  dynamic genderType;
  void setGenderType(type) {
    genderType = type;
    update();
  }

  /// Person List -----------------------------------------------------------
  User user = User(id: 0, name: 'Select User');
  List<User> userList = [
    User(id: 1, name: 'Alice'),
    User(id: 2, name: 'Bob'),
    User(id: 3, name: 'Charlie'),
    User(id: 4, name: 'Diana'),
    User(id: 5, name: 'Ethan'),
    User(id: 6, name: 'Fiona'),
    User(id: 7, name: 'George'),
    User(id: 8, name: 'Hannah'),
    User(id: 9, name: 'Ian'),
    User(id: 10, name: 'Jane'),
  ];

  void setUser(String name) {
    user = userList.firstWhere((element) => element.name == name);
    update();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
