
import 'package:country_list_case_study/extensions/util_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/color_constant.dart';

class AllCommonTextView extends StatelessWidget
{
  final String title;
  final String content;
  final Icon icon;

  AllCommonTextView(this. title,  this.content,  this.icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: 30.marginLeftRightTopBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon.icon,
            color: ColorConstant.colorApp,
            size: 30.0,
          ),
          SizedBox(width: 1.w),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              content,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: ColorConstant.colorApp,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

}
