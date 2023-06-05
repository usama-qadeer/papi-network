import 'package:flutter/material.dart';
import 'package:papi_network/ui/main_screens/team/security_circle.dart';
import 'package:papi_network/ui/main_screens/team/team_tab.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/my_app_bar.dart';

class Team1 extends StatefulWidget {
  bool? popScreen;
  Team1({this.popScreen, Key? key}) : super(key: key);

  @override
  State<Team1> createState() => _Team1State();
}

class _Team1State extends State<Team1> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: ,
        body: Stack(
          children: [
            BackgroundImage(imageName: 'GrayUp'),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: MyAppBar.appBar(context,
                  txt: 'Team',
                  backGroundColor: AppColors.pinkPurpleAppBar,
                  textAndIconsColor: Colors.white, onPressed: () {
                if (widget.popScreen == true) {
                  Navigator.pop(context);
                }
              }),
              body: Column(
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        // gradient: LinearGradient(colors: [
                        //   Colors.red,
                        //   Colors.blue,
                        //   Colors.white,
                        //   Colors.red,
                        //   Colors.blue
                        // ]),
                        color: Colors.white,
                      ),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          gradient: LinearGradient(
                              colors: [AppColors.pink, AppColors.blue]),
                          color: AppColors.pinkPurpleAppBar,
                        ),
                        tabs: [
                          Tab(
                            text: 'Team',
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Security Circle'),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'assets/icons/questionMark.png',
                                height: 14,
                              ),
                            ],
                          )
                          // Tab(
                          //   icon: Icon(Icons.question_mark),
                          //   text: 'Security Circle',
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        TeamTab(),
                        SecurityCircle(),
                        // Tab(
                        //   text: 'Team',
                        // ),
                        // Tab(
                        //   text: 'Security',
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
