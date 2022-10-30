import 'package:country_list_case_study/routes/app_pages.dart';
import 'package:country_list_case_study/routes/app_routes.dart';
import 'package:country_list_case_study/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';

import 'Screens/splash_page.dart';
import 'base/controller/hive_db_controller.dart';

GlobalKey<NavigatorState> globalKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HiveDBController());   // calls the controller of hive db
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // for responsive app we have used sizer.
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          navigatorKey: globalKey,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          home: new SplashPage(),
          defaultTransition: Transition.rightToLeft);
    });
  }
}
