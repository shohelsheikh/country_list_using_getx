import 'dart:convert';
import '../../models/country_list_response.dart';
import '../network/ApiHitter.dart';
import '../network/api_endpoint.dart';
import 'package:http/http.dart' as http;

class CountryListRepo {

  final apiHitter = ApiHitter();

  // fetched country list using dio
  static Future<List<CountryListResponse>> all_country_list_web() async {
    List<CountryListResponse> _countryList = [];
    var response = await ApiHitter.getApiResponse(
      ApiEndPoint.all_country_list,
      baseUrl: ApiEndPoint.baseUrl,
    );
    if (response.status) {
      var jsonList = response.response?.data as List;
      for (var element in jsonList) {
        _countryList.add(CountryListResponse.fromJson(element));
      }
      return _countryList;
    } else {
      return _countryList;
    }
  }

  // fetched country list using http
  static Future<List<CountryListResponse>> getCountries() async {
    List<CountryListResponse> _countryList = [];

    final response = await http
        .get(Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.all_country_list));
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body) as List;

      for (var element in jsonList) {
        _countryList.add(CountryListResponse.fromJson(element));
      }
      return _countryList;
    } else {
      return _countryList;
    }
  }
}
