// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:papi_network/models/show_nickname_model.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/ui/user_profile_screens/KYC_Verification/KYC_verification_1.dart';
import 'package:papi_network/ui/user_profile_screens/account_and_security/account_and_security.dart';
import 'package:papi_network/ui/user_profile_screens/event_center/event_center.dart';
import 'package:papi_network/ui/user_profile_screens/invitation_code_and_username.dart';
import 'package:papi_network/ui/user_profile_screens/update_nickname.dart';
import 'package:papi_network/utils/extensions.dart';
import 'package:papi_network/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../widgets/app_button.dart';
import '../auth/sign_up.dart';
import '../main_screens/invite_widget.dart';
import '../main_screens/team/team_1.dart';
import '../user_profile_tasks_screens/about_screen.dart';
import '../user_profile_tasks_screens/languages_screen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isVisible = true;
  ShowNickNameModel? _nickNameModel;

  @override
  Widget build(BuildContext context) {
    // print(
    //     "nicknamemodel ${_nickNameModel!.profile!.nickName ?? "kkkkk".toString()}");
    final userPreference = Provider.of<UserViewModel>(context);
    // final userData = Provider.of<AuthProvider>(context);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/images/frame2.png',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: -30,
                  left: size.width / 3,
                  right: size.width / 3,
                  child: Center(
                      child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      color: Colors.grey.shade400,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    30.sizeWith,
                    FutureBuilder(
                      future: AuthProvider().getUserNickName(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.profile!.nickName.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          );
                        }
                        return Text("Loading....");
                      },
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateNickName()));
                        },
                        icon: ImageIcon(
                          AssetImage('assets/icons/profileIcons/edit.png'),
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text(_nickNameModel!.profile!.nickName ??
                      //     "kkk".toString()),
                      30.sizeWith,
                      FutureBuilder(
                        future: AuthProvider().getUserNickName(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.profile!.userName ??
                                  "Loading...".toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            );
                          }
                          return Text("Loading...");
                        },
                      ),
                      // Text(
                      //   userData.getUserNickName().toString().length.toString(),
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InvitationCodeAndUsername()));
                          },
                          icon: ImageIcon(
                            AssetImage('assets/icons/profileIcons/edit.png'),
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  InviteWidget(),
                  11.sizeHeight,
                  Material(
                    color: Colors.white,
                    elevation: 1.0,
                    borderRadius: BorderRadius.circular(11),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Follow us on social Media',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 60,
                            // width: 222,
                            child: ListView.builder(
                              itemCount: 8,
                              scrollDirection: Axis.horizontal,
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceEvenly,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    10.sizeWith,
                                    Image.asset(
                                      'assets/icons/facebook2.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                    15.sizeWith,
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  myTile(
                      title: 'Tasks',
                      icon: 'assets/icons/profileIcons/tasks.png'),
                  myTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InvitationCodeAndUsername()));
                      },
                      title: 'Invitation Code',
                      icon: 'assets/icons/profileIcons/person.png'),
                  myTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventCenter()));
                      },
                      title: 'Event Center',
                      icon: 'assets/icons/profileIcons/event.png'),
                  myTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Team1(
                                      popScreen: true,
                                    )));
                      },
                      title: 'Earning Team',
                      icon: 'assets/icons/profileIcons/team.png'),
                  myTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountAndSecurity()));
                      },
                      title: 'Account & Security',
                      icon: 'assets/icons/profileIcons/security.png'),
                  myTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KYCVerification1()));
                      },
                      title: 'KYC Verification',
                      icon: 'assets/icons/profileIcons/scane.png'),
                  myTile(
                      title: 'History',
                      icon: 'assets/icons/profileIcons/history.png'),
                  myTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LanguagesScreen()));
                      },
                      title: 'Language',
                      icon: 'assets/icons/profileIcons/language.png'),
                  myTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                      title: 'About',
                      icon: 'assets/icons/profileIcons/about.png'),
                  myTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15.0)), //this right here
                                child: Container(
                                  height: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // border:
                                    //     Border.all(color: Colors.blue, width: 2)
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 67,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                  color: AppColors
                                                      .pinkPurpleAppBar),
                                              child: Center(
                                                child: Icon(
                                                  Icons.warning_rounded,
                                                  color: Colors.white,
                                                  size: 50,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 33,
                                            ),
                                            Text(
                                              'Confirm',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                            13.sizeHeight,
                                            Text(
                                              'Are you sure you want to Sign Out?',
                                              style: TextStyle(
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'CANCEL',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors
                                                        .purpleTextColor),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 22,
                                            ),
                                            AppButton(
                                              radius: 22,
                                              onPressed: () {
                                                userPreference
                                                    .remove()
                                                    .then((value) {
                                                  Navigator.pop(context);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SignUp()));
                                                });
                                              },
                                              child: Text('Confirm'),
                                              width: 120,
                                              height: 32,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => RegisterScreen()));
                      },
                      title: 'Sign Out',
                      icon: 'assets/icons/profileIcons/signOut.png'),
                  20.sizeHeight,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myTile(
      {required String title, required String icon, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Material(
        color: Colors.white,
        elevation: 1.0,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 40,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(icon),
                    size: 25,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
