import 'package:papi_network/models/TestModel.dart';

import '../constants/app_urls.dart';
import '../data/network/base_api_services.dart';
import '../data/network/networkApiServices.dart';

class TestRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TestModel> fetchTest() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.testGetApiUrl, '');

      return response = TestModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
