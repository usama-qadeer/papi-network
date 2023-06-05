import 'package:flutter/foundation.dart';
import 'package:papi_network/constants/app_urls.dart';
import 'package:papi_network/data/network/base_api_services.dart';

import '../data/network/networkApiServices.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  /// Login Api Call
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.loginEndPoint} ************************');
      }
      return response;
    } catch (e) {
      throw e;
    }
  }

  /// Register Api Call
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.registerEndPoint} ************************');
      }
      return response;
    } catch (e) {
      throw e;
    }
  }

  /// Forget Api Call
  Future<dynamic> forgetApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.forgetPasswordEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.forgetPasswordEndPoint} ************************');
      }

      return response;
    } catch (e) {
      throw e;
    }
  }

  /// update password Api Call
  Future<dynamic> forgetUsingPhoneApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.forgetUsingPhoneEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.forgetUsingPhoneEndPoint} ************************');
      }

      return response;
    } catch (e) {
      throw e;
    }
  }

  /// update password Api Call
  Future<dynamic> updatePasswordApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.updatePasswordEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.updatePasswordEndPoint} ************************');
      }

      return response;
    } catch (e) {
      throw e;
    }
  }
}
