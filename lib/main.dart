import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/bindings/initial_binding.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/data/repositories/init_settings_repository.dart' as init_settings_repo;
import 'app/routes/app_pages.dart';
import 'config/app_theme.dart';
import 'config/translations/localization_service.dart';
import 'utils/connection_checker.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // init shared preference
  await MySharedPref.init();
  // transparent status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  // init internet checker
  // ConnectionChecker.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          navigatorKey: init_settings_repo.navigatorKey,
          title: "Ososs Test",
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          // theme:  MyAppTheme.lightThemeData,
          locale: MySharedPref.getCurrentLocal(), // app language
          translations: LocalizationService(), // localization services in app
        );
      },
    );
  }
}


