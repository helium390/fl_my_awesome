import 'package:get/get.dart';

class RadioController extends GetxController {
  static RadioController get to => Get.find();

  RadioController();

  bool isLoading = false;

  String selectedOption = '';

  final List optionType = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  void setOption(dType) {
    selectedOption = dType;
    update();
  }

  String selectedChoice = '';

  final List choiceList = [
    'Choice 1',
    'Choice 2',
  ];

  void setChoice(choice) {
    selectedChoice = choice;
    update();
  }

  var check1 = false;
  var check2 = false;
  var check3 = false;
  bool termsCondition = false;

  void setCheck1(check) {
    check1 = check;
    update();
  }

  void setCheck2(check) {
    check2 = check;
    update();
  }

  void setCheck3(check) {
    check3 = check;
    update();
  }

  void checkTermsCondition() {
    termsCondition = !termsCondition;
    update();
  }

  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;

  void toggleSwitch1(bool value) {
    switch1 = value;
    update();
  }

  void toggleSwitch2(bool value) {
    switch2 = value;
    update();
  }

  void toggleSwitch3(bool value) {
    switch3 = value;
    update();
  }

  void toggleSwitch4(bool value) {
    switch4 = value;
    update();
  }



  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
