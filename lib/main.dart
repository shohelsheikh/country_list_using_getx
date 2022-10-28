import 'package:country_list_case_study/routes/app_pages.dart';
import 'package:country_list_case_study/routes/app_routes.dart';
import 'package:country_list_case_study/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';

import 'base/controller/hive_db_controller.dart';

GlobalKey<NavigatorState> globalKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HiveDBController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          navigatorKey: globalKey,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.SPLASH_SCREEN,
          getPages: AppPages.pages,
          defaultTransition: Transition.rightToLeft);
    });
  }
}
