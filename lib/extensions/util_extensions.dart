import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../utils/color_constant.dart';

extension Utility on String {
  toastError({Color color = ColorConstant.colorWhite}) {
    Fluttertoast.showToast(
      msg: this,
      textColor: color,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.red,
    );
  }
}

extension Integer on int {
  delay(Function function) {
    Future.delayed(Duration(seconds: this), () {
      function();
    });
  }

  marginLeftRightTopBottom({int? top, int? bottom}) {
    return EdgeInsets.only(
      left: toDouble(),
      right: toDouble(),
      top: top?.toDouble() ?? 0.0,
      bottom: bottom?.toDouble() ?? 0.0,
    );
  }

}
