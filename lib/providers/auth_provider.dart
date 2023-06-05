// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:papi_network/models/get_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_urls.dart';
import '../models/get_team_api.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  /// for loading
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  /// for Password Visibility
  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;
  setPasswordVisibility(bool value) {
    _passwordVisibility = value;
    notifyListeners();
  }

  /// Register Function
  void register(
    context, {
    required String email,
    required String password,
    required String name,
  }) async {
    setLoading(true);

    try {
      Response response = await post(
        Uri.parse('$baseUrl/register/user'),
        body: {
          'email': email,
          'password': password,
          'name': name,
        },
      );
      if (response.statusCode == 200) {
        setLoading(false);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => OTPScreen()));
        debugPrint('account created successfully');
        Utils.flutterToast('account created successfully');
      } else {
        setLoading(false);
        debugPrint('Failed');
        Utils.flutterToast('Failed');
      }
    } catch (e) {
      setLoading(false);
      debugPrint(e.toString());
      Utils.flutterToast(e.toString());
    }
  }

  /// Login With Email Function
  void loginWithEmail(
    context, {
    required String email,
    required String password,
    // required String name,
  }) async {
    setLoading(true);

    try {
      Response response = await post(
        Uri.parse('$baseUrl/login/user'),
        body: {
          'email': email,
          'password': password,
          // 'name': name,
        },
      );
      if (response.statusCode == 200) {
        setLoading(false);

        var data = jsonDecode(response.body.toString());
        debugPrint(data.toString());
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => BottomNavigationBarForApp()));
        debugPrint('login successfully');
        Utils.flutterToast('Login successfully');
      } else {
        setLoading(false);
        debugPrint('Failed');
        Utils.flutterToast('Failed');
      }
    } catch (e) {
      setLoading(false);
      debugPrint(e.toString());
      Utils.flutterToast(e.toString());
    }
  }

  Future<GetTeamFromApiModel> getTeamAPI() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    debugPrint("teamToken ${token}");
    var headers = {'Authorization': 'Bearer $token'};
    var response =
        await http.get(Uri.parse('$baseUrl/Team/get/'), headers: headers);
    if (response.statusCode == 200) {
      debugPrint("TeamAPIResponse${response.body}");

      return GetTeamFromApiModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.reasonPhrase);
      return GetTeamFromApiModel();
    }
  }

  Future<GetNEWSModel> getNewsFromAPI() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var response =
        await http.get(Uri.parse('$baseUrl/News/get/'), headers: headers);
    notifyListeners();
    if (response.statusCode == 200) {
      debugPrint("NewsFormApi${response.body}");
      return GetNEWSModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.reasonPhrase);
      return GetNEWSModel();
    }
  }
}
