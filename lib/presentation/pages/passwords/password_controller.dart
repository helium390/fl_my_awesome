import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  static PasswordController get to => Get.find();

  PasswordController();

  bool isLoading = false;
  bool buttonActive = false;

  TextEditingController passwordController = TextEditingController();
  bool eightCharacters = false;
  bool oneUppercase = false;
  bool oneSpecialChar = false;
  bool oneDigit = false;

  void checkPassword() {
    eightCharacters = passwordController.text.length >= 8;
    oneUppercase = passwordController.text.contains(RegExp(r'[A-Z]'));
    oneDigit = passwordController.text.contains(RegExp(r'[0-9]'));
    oneSpecialChar =
        passwordController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    buttonActive =
        eightCharacters && oneUppercase && oneDigit && oneSpecialChar;
    update();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
