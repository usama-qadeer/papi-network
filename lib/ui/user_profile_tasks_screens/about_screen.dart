import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../widgets/my_app_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'About',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            singleTitlesWidget(title: 'White Paper'),
            singleTitlesWidget(title: 'FAQs'),
            singleTitlesWidget(title: 'Rules'),
            singleTitlesWidget(title: 'Contact Us'),
          ],
        ),
      ),
    );
  }

  ///***********************  Single Titles Widget **********************
  Widget singleTitlesWidget({
    required String? title,
  }) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 21),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.pink, AppColors.blue]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
