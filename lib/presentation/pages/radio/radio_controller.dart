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

  /// Others -------------------------------------------------------------------
  void changeLoading() {
    isLoading = !isLoading;
    update();
  }
}
