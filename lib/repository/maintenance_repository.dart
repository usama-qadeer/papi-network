import 'package:flutter/foundation.dart';

import '../constants/app_urls.dart';
import '../data/network/base_api_services.dart';
import '../data/network/networkApiServices.dart';
import '../models/maintenance_model.dart';

class MaintenanceRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MaintenanceModel> fetchMaintenanceData() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.maintenanceEndPoint, 'there is no token');
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.maintenanceEndPoint} ************************');
      }

      return response = MaintenanceModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
