import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/string_utils.dart';

class FormatsController extends GetxController {
  static FormatsController get to => Get.find();

  FormatsController();

  bool isLoading = false;

  var phoneController = TextEditingController();
  var birthdayController = TextEditingController();
  var thousandController = TextEditingController();
  var numericRangeController = TextEditingController();
  var prefixController = TextEditingController();

  String getTrim(String value) {
    return value.trim().replaceAll(',', '');
  }

  String getTrimToDouble(String value) {
    return StringUtils.convertToDouble(value).toString();
  }

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
