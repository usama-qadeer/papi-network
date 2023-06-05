import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/auth/help/help_screen_2.dart';
import 'package:papi_network/ui/auth/help/help_screen_4.dart';
import 'package:papi_network/widgets/bollet_title.dart';
import 'package:papi_network/widgets/my_app_bar.dart';

class HelpScreen1 extends StatefulWidget {
  const HelpScreen1({Key? key}) : super(key: key);

  @override
  State<HelpScreen1> createState() => _HelpScreen1State();
}

class _HelpScreen1State extends State<HelpScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'Login Help',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletTitle(title: 'Request Account Recovery'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpScreen2()));
                      },
                      child: doubleTitlesWidget(
                          title: 'Other Situation',
                          sunTitle: 'Cannot receive verification code'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpScreen4(
                                      showContainer: true,
                                    )));
                      },
                      child: doubleTitlesWidget(
                          title: 'The bound phone number is still in use',
                          sunTitle: 'Reset password with phone number'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpScreen4(
                                      showContainer: false,
                                    )));
                      },
                      child: doubleTitlesWidget(
                          title: 'The bound email is still in use',
                          sunTitle: 'Reset password with email'),
                    ),
                  ],
                ),
              ),
              BulletTitle(title: 'FAQs'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    singleTitlesWidget(title: 'Q1.  What’s invitation code?'),
                    singleTitlesWidget(
                        title: 'Q2.  How to find invitation code?'),
                    singleTitlesWidget(
                        title: 'Q3.  Why is my  Papi balance 0?'),
                    singleTitlesWidget(title: 'Q4.  What’s invitation code?'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///***********************  Double Titles Widget **********************

  Widget doubleTitlesWidget({
    required String? title,
    required String? sunTitle,
  }) {
    return Container(
      width: double.infinity,
      // height: 22,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 21),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.pink, AppColors.blue]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                sunTitle!,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  ///***********************  Single Titles Widget **********************
  Widget singleTitlesWidget({
    required String? title,
  }) {
    return Container(
      width: double.infinity,
      // height: 22,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 21),
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
            Icons.keyboard_arrow_down,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
