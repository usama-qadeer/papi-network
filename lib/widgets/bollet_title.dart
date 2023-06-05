import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';

class BulletTitle extends StatelessWidget {
  String? title;
  int? spaceToLeft;
  BulletTitle({this.spaceToLeft, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 5,
          height: 22,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.pink, AppColors.blue]),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          title!,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
