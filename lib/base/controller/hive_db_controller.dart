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
    box = await HiveUtil.openBox(TableConstant.localDB);
    super.onInit();
  }

  read(String key) {
    final value = box.get(key);
    if (value != null) return json.decode(value);
    return null;
  }

  save(String key, value) async {
    try {
      await box.put(key, json.encode(value));
    } catch (e) {
      debugPrint("Save error : $e");
    }
  }

  deleteBox(String key) async {
    await box.delete(key);
  }

  clearBox() async {
    await box.clear();
  }
}
