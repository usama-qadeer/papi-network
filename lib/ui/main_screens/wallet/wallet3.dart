import 'package:flutter/material.dart';
import 'package:papi_network/ui/main_screens/invite_screen.dart';
import 'package:papi_network/ui/main_screens/team/team_1.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/bordered_app_button.dart';

class Wallet3 extends StatefulWidget {
  const Wallet3({Key? key}) : super(key: key);

  @override
  State<Wallet3> createState() => _Wallet3State();
}

class _Wallet3State extends State<Wallet3> {
  ValueNotifier<bool> _ambassadorInfo = ValueNotifier<bool>(true);
  ValueNotifier<bool> _verifierInfo = ValueNotifier<bool>(true);
  ValueNotifier<bool> _pioneerInfo = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pinkPurpleAppBar,
        centerTitle: true,
        title: Text('99.1267'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          14.sizeHeight,
          Container(
            height: 65,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Rate',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '0.29 papi/hr',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _pioneerInfo,
            builder: (context, value, child) {
              return _pioneerInfo.value
                  ? smallWidget(
                      title: 'Pioneer',
                      perHour: '0.29 papi/hr',
                      onPressed: () {
                        _pioneerInfo.value = !_pioneerInfo.value;
                      })
                  : Container(
                      height: 80,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 4,
                              color: Colors.grey,
                              blurRadius: 7,
                              offset: Offset(3, 6), // Shadow position
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.only(bottom: 15),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImageIcon(
                                  AssetImage(
                                      'assets/icons/profileIcons/person.png'),
                                  size: 20,
                                  color: Colors.black,
                                ),
                                11.sizeWith,
                                Text(
                                  'Pioneer',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  '0.29 papi/hr',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                IconButton(
                                    // splashRadius: 2,
                                    // padding: EdgeInsets.all(1),
                                    onPressed: () {
                                      _pioneerInfo.value = !_pioneerInfo.value;
                                    },
                                    icon: Icon(Icons.keyboard_arrow_up))
                              ],
                            ),
                          ),
                          Container(
                            height: 0.5,
                            color: Colors.grey,
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  'Current Sessions ends in',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                Spacer(),
                                Text(
                                  '23:57:59',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _ambassadorInfo,
            builder: (context, value, child) {
              return _ambassadorInfo.value
                  ? smallWidget(
                      title: 'Ambassador',
                      perHour: '0.29 papi/hr',
                      onPressed: () {
                        _ambassadorInfo.value = !_ambassadorInfo.value;
                      })
                  : bigWidget(
                      title: 'Ambassador',
                      perHour: '0.29 papi/hr',
                      onPressed: () {
                        _ambassadorInfo.value = !_ambassadorInfo.value;
                      },
                      active: 1,
                      inActive: 4,
                      activePerHour: '0.00 papi/hr',
                      teamMembers: 5,
                      pioneerMembers: 4);
            },
          ),
          ValueListenableBuilder(
            valueListenable: _verifierInfo,
            builder: (context, value, child) {
              return _verifierInfo.value
                  ? smallWidget(
                      title: 'Verifier',
                      perHour: '0.29 papi/hr',
                      onPressed: () {
                        _verifierInfo.value = !_verifierInfo.value;
                      })
                  : bigWidget(
                      title: 'Verifier',
                      perHour: '0.29 papi/hr',
                      onPressed: () {
                        _verifierInfo.value = !_verifierInfo.value;
                      },
                      active: 1,
                      inActive: 4,
                      activePerHour: '1x20.00% x (0.20 papi/hr) = 0.04 papi/hr',
                      teamMembers: 5,
                      pioneerMembers: -1);
            },
          ),
          35.sizeHeight,
          Center(
            child: Text(
              'Learn more about each role',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          22.sizeHeight,
        ],
      ),
    );
  }

  ///****************************************************************
  ///****************************************************************
  ///****************       Two Buttons      ***********************
  ///****************************************************************
  ///****************************************************************

  Widget twoButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BorderedAppButton(
            radius: 8,
            gradient: LinearGradient(colors: [AppColors.pink, AppColors.pink]),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Team1(
                            popScreen: true,
                          )));
            },
            child: Text(
              'View your team',
              style: TextStyle(color: AppColors.pink, fontSize: 12),
            ),
            height: 37,
            // width: 170,
          ),
        ),
        18.sizeWith,
        Expanded(
          child: AppButton(
            radius: 8,
            gradient: LinearGradient(colors: [AppColors.pink, AppColors.pink]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InviteScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.person_add_alt_1_outlined,
                  size: 17,
                ),
                Text(
                  'Invite your Friend',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            height: 37,
            // width: 170,
          ),
        ),
      ],
    );
  }

  ///****************************************************************
  ///****************************************************************
  ///****************       Small Widget      ***********************
  ///****************************************************************
  ///****************************************************************

  Widget smallWidget(
      {required String title,
      required String perHour,
      required VoidCallback onPressed}) {
    return Container(
      height: 80,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          spreadRadius: 4,
          color: Colors.grey,
          blurRadius: 7,
          offset: Offset(3, 6), // Shadow position
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(bottom: 15, left: 15, top: 15),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage('assets/icons/profileIcons/person.png'),
            size: 20,
            color: Colors.black,
          ),
          11.sizeWith,
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            perHour,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          IconButton(
              // splashRadius: 2,
              // padding: EdgeInsets.all(1),
              onPressed: onPressed,
              icon: Icon(Icons.keyboard_arrow_down))
        ],
      ),
    );
  }

  ///****************************************************************
  ///****************************************************************
  ///****************       Big Widget      ***********************
  ///****************************************************************
  ///****************************************************************

  Widget bigWidget(
      {required String title,
      required String perHour,
      required int active,
      required int inActive,
      required int teamMembers,
      required int pioneerMembers,
      required String activePerHour,
      required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          spreadRadius: 4,
          color: Colors.grey,
          blurRadius: 7,
          offset: Offset(3, 6), // Shadow position
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageIcon(
                  AssetImage('assets/icons/profileIcons/person.png'),
                  size: 20,
                  color: Colors.black,
                ),
                11.sizeWith,
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  perHour,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                IconButton(
                    // splashRadius: 2,
                    // padding: EdgeInsets.all(1),
                    onPressed: onPressed,
                    icon: Icon(Icons.keyboard_arrow_up))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            height: 0.5,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active ($active)',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                4.sizeHeight,
                Text(
                  activePerHour,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                10.sizeHeight,
                Text(
                  'Inactive ($inActive)',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                10.sizeHeight,
                Container(
                  width: 80,
                  height: 25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColors.pink, AppColors.blue]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          // shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                'assets/icons/clock.png',
                              ),
                              color: AppColors.purpleTextColor,
                              size: 15,
                            ),
                            Text(
                              'Ping',
                              style:
                                  TextStyle(color: AppColors.purpleTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                23.sizeHeight,

                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                23.sizeHeight,
                pioneerMembers == -1
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You have invited ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.grey),
                          ),
                          3.sizeHeight,
                          Text(
                            '$pioneerMembers Pioneer(s)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.grey),
                          ),
                          9.sizeHeight,
                        ],
                      ),
                Text(
                  'Your team has',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.grey),
                ),
                3.sizeHeight,
                Text(
                  '$teamMembers Members',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey),
                ),
                15.sizeHeight,
                // pioneerMembers == -1 ? 45.sizeHeight : 0.sizeHeight,
                twoButtons(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
