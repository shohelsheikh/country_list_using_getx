import 'package:country_list_case_study/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/country_list_controller.dart';
import '../../locales/locale_constant.dart';
import '../../utils/asset_helper.dart';
import '../../utils/color_constant.dart';

import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CountryListPage extends GetView<CountryListController> {
  // Added country list controller for getting data from it.
  final CountryListController _countryListController =
      Get.find<CountryListController>();

  @override
  Widget build(BuildContext context) {
    _countryListController.CountryListControllerInitializer(context);
    return Scaffold(
        appBar: appBarWidget(context),
        body: Obx(() {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Column(
                children: <Widget>[searchBar(), countryListView()],
              ),
            ],
          );
        }));
  }

  // App Bar
  appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstant.colorWhite,
      automaticallyImplyLeading: false,
      centerTitle: true,
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
            '# '+ StringsConstant.appName,
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

  // Search Bar
  Widget searchBar() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
      height: 5.h,
      child: TextFormField(
        onChanged: (value) {
          _countryListController.filterSearchResults(value);
        },
        controller: _countryListController.txtSearch,
        readOnly: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorConstant.searcbBarcolor, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorConstant.searcbBarcolor, width: 2.0),
          ),
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: StringsConstant.searchCountry,
        ),
      ),
    );
  }

  // Country Listview
  Widget countryListView() {
    return Expanded(
      flex: 1,
      child: (_countryListController.STATE_NO_DATA_AVAIL.value == true)
          ? ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _countryListController.countryListNew.value.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctxt, int index) {
                return countryListItem(ctxt, index);
              },
            )
          : Center(
              child: Text(
                (_countryListController.LIST_STATE.value),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
    );
  }

  // Country Listitem
  Widget countryListItem(BuildContext context, int index) {
    String? name =
        _countryListController.countryListNew.value[index].name?.common;
    String? capital =
        _countryListController.countryListNew.value[index].capital;
    String? image =
        _countryListController.countryListNew.value[index].flags?.png;
    return InkWell(
      onTap: () {
        _countryListController.clickIndex.value = index;
        Get.toNamed(AppRoutes.CountryDetailPage);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: image ?? "",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    new Image.asset(AssetHelper.noimage),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    capital ?? "",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
