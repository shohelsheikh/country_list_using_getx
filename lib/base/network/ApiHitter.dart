import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:country_list_case_study/base/network/api_endpoint.dart';
import 'package:country_list_case_study/utils/util.dart';

class ApiHitter {
  static Dio? _dio;

  // ----------------- ------------ Dio Request Call ----------------------------

  Dio? getDio({String baseUrl = ''}) {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: baseUrl.isEmpty ? ApiEndPoint.baseUrl : baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      return Dio(options)
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              return handler.next(options);
            },
            onResponse: (response, handler) {
              return handler.next(response);
            },
            onError: (DioError e, handler) async {
              debugPrint("onError method called");
              disposeProgress();
              if (e.response?.statusCode != null &&
                  e.response?.statusCode == 401) {
                debugPrint("onError status code : ${e.response?.statusCode}");
              } else {
                debugPrint("response in error :: ${e.toString()}");
                return handler.next(e);
              }
            },
          ),
        );
    } else {
      return _dio;
    }
  }

  // --------------------------------- Get API ---------------------------------

  Future<ApiResponse> getApiResponse(String endPoint, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    String baseUrl = '',
  }) async {
    bool value = true;
    if (!kIsWeb) {
      value = await checkInternetConnection();
    }
    if (value) {
      try {
        var response = await getDio(
          baseUrl: baseUrl,
        )!.get(
          endPoint,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            contentType: "application/json",
          ),
        );
        return ApiResponse(
          response.statusCode == 200,
          response: response,
          msg: response.statusMessage,
        );
      } catch (error) {
        debugPrint("Error get API response :: $error");
        return exception(error);
      }
    } else {
      debugPrint("internet not connected ");
      return ApiResponse(
        false,
        msg: "Check your internet connection and Please try again later.",
      );
    }
  }
  exception(error) {
    try {
      debugPrint("response  get in exception " + error.toString());
      return ApiResponse(
        false,
        msg:
        "${error?.response?.data['message'] ?? "Sorry Something went wrong."}",
      );
    } catch (e) {
      if (DioErrorType.other == error.type ||
          DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        debugPrint("error msg" + error.toString());
        if (error.message.contains('SocketException')) {
          return ApiResponse(
            false,
            msg: "Check your internet connection and Please try again later.",
          );
        }
      } else {
        return ApiResponse(false, msg: "Sorry Something went wrong.");
      }
    }
  }
}
// -----------------------------------------------------------------------------
class ApiResponse {
  final bool status;
  final String? msg;
  final Response? response;
  ApiResponse(this.status, {
    this.msg = "Success",
    this.response,
  });
}
