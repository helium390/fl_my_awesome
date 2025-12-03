class AppAssets {
  static Images images = const Images();
  static IconsInAssets icons = const IconsInAssets();
  static Lotties lotties = const Lotties();
  static Texts texts = const Texts();
}

class Images {
  const Images();

  String get splash => "assets/images/splash.png";
  String get fingerprint => "assets/images/fingerprint.png";
  String get bug => "assets/images/ic_bug.png";
  String get suggestion => "assets/images/ic_suggestion.png";
  String get compliment => "assets/images/ic_compliment.png";
  String get passport => "assets/images/passport.png";
}

class IconsInAssets {
  const IconsInAssets();

  String get back => "assets/icons/ic_back.svg";
  String get close => "assets/icons/ic_close.svg";
  String get verifyOk => "assets/icons/ic_verify_ok.svg";
  String get verifyNo => "assets/icons/ic_verify_no.svg";
  String get delete => "assets/icons/ic_delete.svg";
  String get verify => "assets/icons/ic_verify.svg";
  String get exit => "assets/icons/exit.svg";
  String get dropdown => "assets/icons/ic_dropdown.svg";
  String get dropdownRed => "assets/icons/ic_dropdown_red.svg";
  String get drag => "assets/icons/ic_drag.svg";
  String get check1 => "assets/icons/ic_check1.svg";
}

class Lotties {
  const Lotties();
  String get loading => "assets/lotties/loading.json";
}

class Texts {
  const Texts();
}
