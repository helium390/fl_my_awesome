class AppAssets {
  static Images images = const Images();
  static IconsInAssets icons = const IconsInAssets();
  static Lotties lotties = const Lotties();
  static Texts texts = const Texts();
}

class Images {
  const Images();

  String get splash => "assets/images/splash.png";
}

class IconsInAssets {
  const IconsInAssets();

  String get back => "assets/icons/ic_back.svg";
  String get close => "assets/icons/ic_close.svg";
  String get verifyOk => "assets/icons/ic_verify_ok.svg";
  String get verifyNo => "assets/icons/ic_verify_no.svg";
  String get delete => "assets/icons/ic_delete.svg";
  String get verify => "assets/icons/ic_verify.svg";
}

class Lotties {
  const Lotties();
  String get loading => "assets/lotties/loading.json";
}

class Texts {
  const Texts();
}
