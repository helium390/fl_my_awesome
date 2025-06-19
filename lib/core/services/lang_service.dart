import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/database/db_service.dart';
import '../locals/en_us.dart';
import '../locals/ko_kr.dart';

class LangService extends Translations {
  // Default locale
  static final locale = defLanguage(DBService.to.getLanguage());

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final items = [
    'English',
    'Korean',
  ];

  static final langs = [
    'en',
    'ko',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ko', 'KR'),
  ];

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'ko_KR': koKR, // lang/ja_jp.dart
      };

  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      DBService.to.setLanguage(lang);
    }
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }

  static String defaultLanguage() {
    final locale = Get.locale;
    var lan = locale.toString();
    if (lan == "en_US") return langs[0];
    if (lan == "ko_KR") return langs[1];
    return langs[0];
  }
}
