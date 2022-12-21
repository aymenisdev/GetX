import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ptoolz/themes/app_theme.dart';
import 'package:ptoolz/view/service_list.dart';
import 'package:ptoolz/view/splash.dart';

import 'binding/initial_binding.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'services/storage_service.dart';
import 'translations/app_translations.dart';

void main() {
  initialConfig();
  runApp(const MyApp());


}

Future<void> initialConfig() async {
  Get.put(StorageService());
  StorageService().init();
  // await Get.putAsync(() => StorageService().init());
  // DBService, ...
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (x,y) => GetMaterialApp(
        // ignore: unnecessary_null_comparison
        locale: storage.languageCode != null
            ? Locale(storage.languageCode!)
            :Locale("ar"),
        translations: AppTranslations(),
        fallbackLocale: Locale("ar"),
        initialBinding: InitialBinding(),
        initialRoute: AppRoutes.splash,
        getPages: appPages,
        defaultTransition: Transition.size,
        builder: EasyLoading.init(),
        theme: lightTheme,
        home:  Splash(),
        debugShowCheckedModeBanner: false,
        title: 'Ptoolz',
      ),
    );
  }
}

