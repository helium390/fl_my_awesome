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

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
