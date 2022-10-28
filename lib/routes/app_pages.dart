import 'package:get/get.dart';
import '../Screens/country_detail/country_detail.dart';
import '../Screens/country_list/country_list_page.dart';
import '../Screens/splash_page.dart';
import '../bindings/country_list_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASH_SCREEN, page: () => const SplashPage()),
    GetPage(
        name: AppRoutes.HistoryPage,
        page: () => CountryListPage(),
        binding: CountryListBinding()),

    GetPage(
        name: AppRoutes.CountryDetailPage,
        page: () => CountryDetailPage(),
        binding: CountryListBinding())
  ];
}