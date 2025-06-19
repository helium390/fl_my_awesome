import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/services/lang_service.dart';
import 'storage_keys.dart';

class DBService {
  final GetStorage _box = GetStorage();

  static DBService get to => Get.find<DBService>();

  static Future<void> init() async {
    await Get.putAsync<DBService>(() async {
      final storageService = DBService();
      await GetStorage.init();
      return storageService;
    }, permanent: true);
  }

  /// App Language =============================================================
  String getLanguage() {
    var lang = _box.read(StorageKeys.LANGUAGE);
    if (lang == null || lang.isEmpty) return LangService.langs[0];

    return lang;
  }

  Future<void> setLanguage(String code) async {
    await _box.write(StorageKeys.LANGUAGE, code);
  }

  /// Access Token =============================================================
  Future<void> setAccessToken(String? value) async {
    await _box.write(StorageKeys.ACCESS_TOKEN, value);
  }

  String getAccessToken() {
    return _box.read(StorageKeys.ACCESS_TOKEN) ?? "";
  }

  /// Firebase Token ===========================================================
  Future<void> setFirebaseToken(String value) async {
    await _box.write(StorageKeys.FIREBASE_TOKEN, value);
  }

  String getFirebaseToken() {
    return _box.read(StorageKeys.FIREBASE_TOKEN) ?? "";
  }
}
