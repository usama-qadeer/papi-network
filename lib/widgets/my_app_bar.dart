import 'package:flutter/material.dart';
import 'package:papi_network/ui/auth/help/help_screen_1.dart';

import '../constants/app_colors.dart';

class MyAppBar {
  static PreferredSizeWidget appBar(context,
      {required String? txt,
      bool boolHelp = false,
      Color backGroundColor = Colors.transparent,
      Color textAndIconsColor = AppColors.purpleTextColor,
      required VoidCallback? onPressed}) {
    return AppBar(
      leading:
          IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_back_ios)),
      iconTheme: IconThemeData(color: textAndIconsColor),
      title: Text(
        txt!,
        style: TextStyle(color: textAndIconsColor),
      ),
      actions: boolHelp == false
          ? []
          : [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpScreen1()));
                  },
                  child: Text(
                    'Help',
                    style: TextStyle(color: AppColors.pink),
                  ))
            ],
      elevation: 0,
      backgroundColor: backGroundColor,
      centerTitle: true,
    );
  }

  static PreferredSizeWidget appBarM(context, {required String? txt}) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.purpleTextColor),
      title: Text(
        txt!,
        style: TextStyle(color: AppColors.purpleTextColor),
      ),
      // leading: IconButton(
      //     onPressed: () {
      //       // Navigator.pushReplacement(context,
      //       //     MaterialPageRoute(builder: (context) => CustomNavigationBar()));
      //     },
      //     icon: Icon(Icons.arrow_back)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}
