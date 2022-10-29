import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:country_list_case_study/base/database/hive_utils.dart';
import 'package:country_list_case_study/base/database/table_constant.dart';

class HiveDBController extends GetxController {
  late Box box;

  @override
  void onInit() async {

    // initialize the hive local database
    box = await HiveUtil.openBox(TableConstant.localDB);
    super.onInit();
  }

  read(String key) {
    // for getting the table data
    final value = box.get(key);
    if (value != null) return json.decode(value);
    return null;
  }

  save(String key, value) async {
    // for storing in table
    try {
      await box.put(key, json.encode(value));
    } catch (e) {
      debugPrint("Save error : $e");
    }
  }

}
