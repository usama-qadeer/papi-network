import 'package:flutter/material.dart';
import 'package:papi_network/ui/auth/sign_up.dart';
import 'package:papi_network/view_model/user_view_model.dart';

import '../models/UserModel.dart';
import '../ui/bottom_navigation_bar.dart';
import '../ui/splash_screen.dart';
import '../ui/update_and_maintenance/maintenance_screen.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(context) async {
    getUserData().then((value) async {
      //
      if (value.token == null || value.token == '' || value.token == 'null') {
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUp()));
      } else {
        await Future.delayed(Duration(seconds: 2));

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavigationBarForApp()));
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }

  void checkMaintenance(context, String value) async {
    if (value == '0') {
      await Future.delayed(Duration(seconds: 1));

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MaintenanceScreen()));
    } else {
      await Future.delayed(Duration(seconds: 1));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
    }
  }
}
