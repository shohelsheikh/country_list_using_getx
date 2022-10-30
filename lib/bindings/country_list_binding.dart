import 'package:get/get.dart';
import '../controller/country_list_controller.dart';

class CountryListBinding implements Bindings {
  // we have used binding for dependency injections in this app.
  @override
  void dependencies() {
    Get.lazyPut<CountryListController>(() {
      return CountryListController();
    });


  }
}