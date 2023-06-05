import 'package:flutter/material.dart';
import 'package:papi_network/ui/user_profile_screens/event_center/NFT_screen.dart';
import 'package:papi_network/ui/user_profile_screens/event_center/all_screen.dart';
import 'package:papi_network/ui/user_profile_screens/event_center/coin_screen.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/my_app_bar.dart';

class EventCenter extends StatefulWidget {
  const EventCenter({Key? key}) : super(key: key);

  @override
  State<EventCenter> createState() => _EventCenterState();
}

class _EventCenterState extends State<EventCenter>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: MyAppBar.appBar(context,
                  txt: 'Event Center',
                  backGroundColor: AppColors.pinkPurpleAppBar,
                  textAndIconsColor: Colors.white, onPressed: () {
                Navigator.pop(context);
              }),
              // AppBar(
              //   title: const Text('Settings'),
              // bottom: PreferredSize(
              //   preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              //   child: Container(
              //     height: 50,
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 5,
              //     ),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(
              //           10,
              //         ),
              //         color: Colors.grey[200],
              //       ),
              //       child: TabBar(
              //         labelColor: Colors.white,
              //         unselectedLabelColor: Colors.black,
              //         indicator: BoxDecoration(
              //           borderRadius: BorderRadius.circular(
              //             10,
              //           ),
              //           color: Colors.pink,
              //         ),
              //         tabs: const [
              //           Tab(
              //             text: 'Basic',
              //           ),
              //           Tab(
              //             text: 'Advanced',
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // ),
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
                        color: Colors.grey[200],
                      ),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: AppColors.pinkPurpleAppBar,
                        ),
                        tabs: const [
                          Tab(
                            text: 'All',
                          ),
                          Tab(
                            text: 'Token',
                          ),
                          Tab(
                            text: 'NFT',
                          ),
                          Tab(
                            text: 'Coin',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AllScreen(),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 111,
                                color: Colors.grey,
                              ),
                              // ImageIcon(
                              //   AssetImage('assets/icons/profileIcons/event.png'),
                              //   size: 44,
                              // ),
                              Text(
                                'New Events coming soon.....',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        NFTScreen(),
                        CoinScreen(),
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
