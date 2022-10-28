import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';
import 'common_button.dart';

mixin AppButton {

  Widget elevatedButton({
    required String title,
    required OnPress onPressed,
  }) {
    return CommonButton(
      backgroundColor: ColorConstant.colorApp,
      fontColor: ColorConstant.colorWhite,
      title: title,
      onPress: onPressed,
    );
  }

}
