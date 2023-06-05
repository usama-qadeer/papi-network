import 'package:flutter/foundation.dart';

import '../constants/app_urls.dart';
import '../data/network/base_api_services.dart';
import '../data/network/networkApiServices.dart';
import '../models/get_mining_setting_model.dart';

class GetMiningSettingRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<GetMiningSettingModel> fetchMiningSettingData(
      {required String token}) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.getMiningSettingEndPoint, token);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.getMiningSettingEndPoint} ************************');
      }

      return response = GetMiningSettingModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
