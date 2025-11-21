import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/app_themes.dart';
import 'config/root_binding.dart';
import 'core/locals/delegates/ko_cupertino_delegate.dart';
import 'core/locals/delegates/ko_material_delegate.dart';
import 'core/services/lang_service.dart';
import 'core/services/root_service.dart';
import 'presentation/pages/splash/splash_page.dart';

void main() async {
  await RootService.init();
  debugPaintSizeEnabled = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 767),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "FL Awesome",
          debugShowCheckedModeBanner: false,
          theme: AppThemes.appTheme,
          initialBinding: RootBinding(),
          initialRoute: SplashPage.id,
          routes: {
            SplashPage.id: (context) => const SplashPage(),
          },

          //Language setting
          fallbackLocale: LangService.fallbackLocale,
          supportedLocales: LangService.locales,
          locale: LangService.locale,
          defaultTransition: Transition.topLevel,
          translations: LangService(),
          localizationsDelegates: [
            CupertinoLocalizationJaDelegate(),
            MaterialLocalizationJaDelegate(),
          ],
          // Before it was not here.
          // After getting issues with overlays
          // like "Unhandled Exception: No Overlay widget found.", we added this.
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(builder: (context) => child!),
              ],
            );
          },
        );
      },
    );
  }
}
