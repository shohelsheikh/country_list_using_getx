import 'package:country_list_case_study/controller/country_list_controller.dart';
import 'package:country_list_case_study/extensions/util_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../utils/asset_helper.dart';
import '../../utils/color_constant.dart';
import '../../widgets/all_text_view.dart';

class CountryDetailPage extends GetView<CountryListController> {

  final NumberFormat areaFormat = NumberFormat('###,###,###,###.#', 'en_US'); // for format the area.

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
        child: countryDetails(),
      ),
    );
  }


  // App Bar
  appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            Get
                .find<CountryListController>()
                .countryListNew[
            Get
                .find<CountryListController>()
                .clickIndex
                .value]
                .name
                ?.common ??
                "",
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  // country detail
Widget countryDetails()
{
  return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(height: 20),
        Image.network(Get.find<CountryListController>()
            .countryListNew[
        Get.find<CountryListController>().clickIndex.value]
            .flags
            ?.png ??
            "", errorBuilder: (context, url, error) {
          // return new Icon(Icons.error);
          return new Image.asset(AssetHelper.noimage,height: 20.h);
        },),
        marginTop(),
        AllCommonTextView(
          "Official Name:",
          Get.find<CountryListController>()
              .countryListNew[
          Get.find<CountryListController>().clickIndex.value]
              .name
              ?.official ??
              "",
          Icon(
            Icons.home,
          ),
        ),
        marginTop(),

        AllCommonTextView(
          "Capital:",
          Get.find<CountryListController>()
              .countryListNew[
          Get.find<CountryListController>().clickIndex.value]
              .capital ??
              "",
          Icon(
            Icons.flag,
          ),
        ),

        marginTop(),


        AllCommonTextView(
          "Continent:",
          Get.find<CountryListController>()
              .countryListNew[
          Get.find<CountryListController>().clickIndex.value]
              .continents ??
              "",
          Icon(
            Icons.flag,
          ),
        ),

        marginTop(),

        AllCommonTextView(
          "Population:",
          Get.find<CountryListController>()
              .countryListNew[
          Get.find<CountryListController>().clickIndex.value].population.toString()??"",
          Icon(
            Icons.people,
          ),
        ),   marginTop(),

        AllCommonTextView(
          "Region:",
          Get.find<CountryListController>()
              .countryListNew[
          Get.find<CountryListController>().clickIndex.value]
              .region  ??
              "",
          Icon(
            Icons.people,
          ),
        ), marginTop(),


        AllCommonTextView(
          "Sub Region:",
          Get.find<CountryListController>()
              .countryListNew[
          Get.find<CountryListController>().clickIndex.value]
              .subregion ??
              "",
          Icon(
            Icons.people,
          ),
        ),
        marginTop(),
        AllCommonTextView(
          "Area:",
          '${areaFormat.format(Get.find<CountryListController>()
              .countryListNew[
          Get.find<CountryListController>().clickIndex.value]
              .area??
              "")} km\u{00B2}'
          ,
          Icon(
            Icons.area_chart,
          ),
        )

        ]);
}

  // margin top
  Widget marginTop() {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
    );
  }




}
