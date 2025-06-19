import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/database/db_service.dart';

class RootService {
  static Future<void> init() async {
    await DBService.init();
    WidgetsFlutterBinding.ensureInitialized();

    // Portrait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
