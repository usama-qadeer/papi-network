import 'package:flutter/cupertino.dart';
import 'package:papi_network/data/response/api_response.dart';
import 'package:papi_network/models/TestModel.dart';
import 'package:papi_network/repository/test_repository.dart';

class TestViewModel with ChangeNotifier {
  final _myRepo = TestRepository();

  ApiResponse<TestModel> testGet = ApiResponse.loading();

  setTestGet(ApiResponse<TestModel> response) {
    testGet = response;
    notifyListeners();
  }

  Future<void> fetchTestApi() async {
    setTestGet(ApiResponse.loading());
    _myRepo.fetchTest().then((value) {
      // code
      setTestGet(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      // code
      setTestGet(ApiResponse.error(error.toString()));
    });
  }
}
