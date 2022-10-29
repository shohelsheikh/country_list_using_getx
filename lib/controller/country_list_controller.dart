import 'dart:async';
import 'package:country_list_case_study/extensions/util_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/controller/hive_db_controller.dart';
import '../base/database/table_constant.dart';
import '../base/repository/country_list_repo.dart';
import '../models/country_list_response.dart';
import '../utils/util.dart';

class CountryListController extends GetxController {

  var countryListRepo = CountryListRepo();
  final HiveDBController _hiveDBController = Get.find();

  var _controllerContext;

  var clickIndex = 0.obs;  // this is for holding the click index of list item of country list

  var countryListNew = <CountryListResponse>[].obs; // it store the country list data for showing in listview
  var countryList = <CountryListResponse>[].obs; // this is extra list maintained for searching purporse in country

  var STATE_NO_DATA_AVAIL = false.obs;
  var LIST_STATE = "".obs; // this is used for showing the state with message to the screen.

  TextEditingController txtSearch =  TextEditingController();

  CountryListControllerInitializer(BuildContext context) {
    _controllerContext = context;
  }

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onResumed() {
  }

  @override
  Future<void> onReady() async {

    var result = _hiveDBController.read(TableConstant.tableCountries);
    if(result != null) {

      for (var element in result) {
        countryList.add(CountryListResponse.fromJson(element));
        countryListNew.add(CountryListResponse.fromJson(element));
      }
      STATE_NO_DATA_AVAIL.value=true;
    }
    else{
      all_country_list_web_api(_controllerContext); // calling  country api when controller is ready..
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  all_country_list_web_api(BuildContext context) async {

    launchProgress(ctx: context);

    List<CountryListResponse>  result =   await CountryListRepo.all_country_list_web();
    disposeProgress();
    if (result.isNotEmpty) {
      countryList.value.clear();
      countryListNew.value.clear();

      STATE_NO_DATA_AVAIL.value=true;
      countryList.value.addAll(result);
      countryListNew.addAll(countryList);
      LIST_STATE.value = "";

      // store in local db..
      _hiveDBController.save(TableConstant.tableCountries, result);
    } else {
      STATE_NO_DATA_AVAIL.value=false;
      LIST_STATE.value = "Failed to load countries.";
      "Failed to load countries.".toastError();
    }
  }
// this is used for searching the country with name
  void filterSearchResults(String query) {
    STATE_NO_DATA_AVAIL.value=false;

    countryListNew.value.clear();
    if(query.trim().length==0){
      countryListNew.value.addAll(countryList.value);
      STATE_NO_DATA_AVAIL.value=true;
    }else{
      for (int i = 0; i < countryList.value.length; i++) {
        String? name = countryList.value[i].name?.common;
        if (name == null) {
          name = "";
        }
        if (name.trim().toLowerCase().contains(query.toLowerCase())) {
          countryListNew.value.add(countryList.value[i]);
        }
      }
      STATE_NO_DATA_AVAIL.value=true;
    }
  }
}