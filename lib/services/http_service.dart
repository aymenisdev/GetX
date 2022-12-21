import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:ptoolz/translations/lang_keys.dart';

import '../model/global_model.dart';
import 'storage_service.dart';

// ignore: constant_identifier_names
enum Method { POST, GET, PUT, DELETE, PATCH }

// ignore: constant_identifier_names
const BASE_URL = "https://ptoolzapi.ptoolz.com/";
// "https://www.ptoolz.com/api/";

class HttpService {
  Dio? _dio;
  final storage = Get.find<StorageService>();

  Future<HttpService> init() async {
    // followRedirects: false,
    // validateStatus: (status) {
    // return status! < 500;
    // }
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 15000,
      receiveTimeout: 15000,
    ))
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
    // initInterceptors();
    return this;
  }

  var logger = Logger(
    printer: PrettyPrinter(colors: true, printEmojis: true, printTime: true),
  );

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.i(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger
              .i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.i("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params,
      bool isUploadImg = false,
      FormData? formData}) async {
    Response response;
    try {
      _dio!.options.headers = {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
        "Accept-Language": storage.languageCode != null
            ? Locale(storage.languageCode!)
            : const Locale('ar'),
        // "Authorization": "Bearer ${storage.getToken() ?? ""}",
        // "device-type": Platform.isAndroid ? "android" : "ios",
        // "device-id": storage.deviceId ?? "",
      };
      if (method == Method.POST) {
        response = await _dio!.post(
          url,
          data: isUploadImg == true ? formData : params,
        );
      } else if (method == Method.PUT) {
        response =
            await _dio!.put(url, data: isUploadImg == true ? formData : params);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }
      return response;
      // if (response.statusCode == 200) {
      //
      // } else if (response.statusCode == 401) {
      //   throw Exception("Unauthorized");
      // } else if (response.statusCode == 500) {
      //   throw Exception("Server Error");
      // } else {
      //   throw Exception("Something does wen't wrong");
      // }
    } on SocketException catch (e) {
      logger.e(e);
      Get.snackbar(LangKeys.error.tr, LangKeys.notInternetConnection.tr);
      // showErrorBottomSheet("Not Internet Connection");
    } on FormatException catch (e) {
      logger.e(e);
      Get.snackbar(LangKeys.error.tr, "Bad response format");
      // showErrorBottomSheet("Bad response format");
    } on DioError catch (e) {
      // logger.e(e);
      String? message;
      switch (e.type) {
        case DioErrorType.cancel:
          message = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          message = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          message = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          if (e.response!.statusCode! == 401) {
            // EasyLoading.showToast("Unauthorized",
            //     duration: const Duration(seconds: 3),
            //     toastPosition: EasyLoadingToastPosition.bottom);
            Get.snackbar(LangKeys.error.tr, e.response?.data['message']);

            // showLogoutBottomSheet(e.response?.data['message']);
            // GlobalModel model = GlobalModel.fromJson(e.response?.data);
            // if (model.StatusCode == -15) {
            //   storage.clearApp();
            //   Get.offAllNamed("/splash");
            // } else {
            //   storage.logoutUser();
            //   Get.offAllNamed("/login");
            // }
          } else {
            message = _handleError(e.response!.statusCode!, e.response?.data);
          }
          break;
        case DioErrorType.sendTimeout:
          message = "Send timeout in connection with API server";
          break;
        case DioErrorType.other:
          message = "تأكد من الاتصال بالانترنت";
          break;
        default:
          message = "Something went wrong";
          break;
      }
      if (message != null && message != "") {
        Get.snackbar(LangKeys.error.tr, message);
        // showErrorBottomSheet(message);
      }
      // throw Exception(e);
    } catch (e) {
      logger.e(e);
      Get.snackbar(LangKeys.error.tr, "Something wen't wrong");
      // showErrorBottomSheet("Something wen't wrong");
    }
  }

// static final Dio _dio = Dio(BaseOptions(
//   baseUrl: 'http://alya.soe.com.sa/api/',
//   connectTimeout: 5000,
//   receiveTimeout: 5000,
//   followRedirects: false,
//   validateStatus: (status) {
//     return status! < 500;
//   },
//   headers: {
//     "AuthIdApp": 1,
//     "AuthTokenApp": "202202071131_510b7e06ac142e1bcd953526e34627",
//     "VersionCodeApp": "1.02",
//     "SystemType": "1",
//   },
// ))
//   ..interceptors.add(PrettyDioLogger(
//     requestHeader: false,
//     requestBody: true,
//     responseBody: true,
//     responseHeader: false,
//     compact: false,
//   ));

}
//

String _handleError(int statusCode, dynamic error) {
  switch (statusCode) {
    case 400:
      return GlobalModel.fromJson(error).msg!;
    case 404:
      return error["message"];
    case 403:
      return GlobalModel.fromJson(error).msg!;
    case 422:
      return GlobalModel.fromJson(error).msg!;
    case 500:
      return 'Internal server error';
    default:
      return 'Oops something went wrong';
  }
}
