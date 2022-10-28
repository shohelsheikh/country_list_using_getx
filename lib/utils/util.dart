import 'dart:async';
import 'dart:io';
import 'package:country_list_case_study/utils/color_constant.dart';
import 'package:flutter/material.dart';

import 'progress_dialog/WidgetPosition.dart';

Future<bool> checkInternetConnection() async {
  bool? status;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      status = true;
    }
  } on SocketException catch (_) {
    debugPrint('Internet not connected');
    status = false;
  }
  return status ?? false;
}

WidgetPosition overlay =  WidgetPosition();

launchProgress({required BuildContext ctx,
  String message = 'Processing..',
  bool isWhite = false}) async {
  overlay.show(
    context: ctx,
    isToast: false,
    externalBuilder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black54,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorConstant.colorApp),
            ),
          ),
        ),
      );
    },
  );
}

disposeProgress() {
 overlay.hide();
}


