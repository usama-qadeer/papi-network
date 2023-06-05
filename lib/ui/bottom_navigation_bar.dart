import 'package:flutter/material.dart';
import 'package:papi_network/ui/main_screens/home_page/home_page.dart';
import 'package:papi_network/ui/main_screens/team/team_1.dart';
import 'package:papi_network/ui/main_screens/v_i_p/v_i_p_screen_1.dart';
import 'package:papi_network/ui/user_profile_screens/user_profile.dart';

import 'main_screens/wallet/wallet_tab_bar.dart';

class BottomNavigationBarForApp extends StatefulWidget {
  const BottomNavigationBarForApp({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarForApp> createState() =>
      _BottomNavigationBarForAppState();
}

class _BottomNavigationBarForAppState extends State<BottomNavigationBarForApp> {
  int _selectedIndex = 0;

  List<Widget> _pages = <Widget>[
    HomePageShowCase(),
    VIPScreen1(),
    Team1(),
    WalletTabBar(),
    UserProfile()
  ];

  bool an1 = true;
  bool an2 = false;
  bool an3 = false;
  bool an4 = false;
  bool an5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages.elementAt(_selectedIndex),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: AppColors.purpleTextColor,
      //   backgroundColor: Colors.grey.shade200,
      //
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/home.png')),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/vip.png')),
      //       label: 'V.I.P',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/team.png')),
      //       label: 'Team',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/wallet.png')),
      //       label: 'Wallet',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/profile.png')),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex, //New
      //   onTap: _onItemTapped,
      // ),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75) // Shadow position
                  ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: .0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                      an1 = true;
                      an2 = false;
                      an3 = false;
                      an4 = false;
                      an5 = false;
                    });
                  },
                  iconImage: 'assets/icons/home.png',
                  yourBool: an1,
                  title: 'Home',
                ),
                item(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                      an1 = false;
                      an2 = true;
                      an3 = false;
                      an4 = false;
                      an5 = false;
                    });
                  },
                  iconImage: 'assets/icons/vip.png',
                  yourBool: an2,
                  title: 'V.I.P',
                ),
                item(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                      an1 = false;
                      an2 = false;
                      an3 = true;
                      an4 = false;
                      an5 = false;
                    });
                  },
                  iconImage: 'assets/icons/team.png',
                  yourBool: an3,
                  title: 'Team',
                ),
                item(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;

                      an1 = false;
                      an2 = false;
                      an3 = false;
                      an4 = true;
                      an5 = false;
                    });
                  },
                  iconImage: 'assets/icons/wallet.png',
                  yourBool: an4,
                  title: 'Wallet',
                ),
                item(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 4;
                      an1 = false;
                      an2 = false;
                      an3 = false;
                      an4 = false;
                      an5 = true;
                    });
                  },
                  iconImage: 'assets/icons/profile.png',
                  yourBool: an5,
                  title: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget item(
      {required VoidCallback onTap,
      required String iconImage,
      required String title,
      required bool yourBool}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Column(
              children: [
                AnimatedContainer(
                  height: yourBool ? 40 : 50,
                  duration: Duration(milliseconds: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        iconImage,
                        color: yourBool ? null : Colors.grey,
                        height: 25,
                      )
                      // ImageIcon(
                      //   AssetImage(
                      //     iconImage,
                      //   ),
                      //   color: yourBool ? Colors.purple : Colors.grey,
                      //   size: 33,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: yourBool ? Colors.purple : Colors.grey,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
