import 'package:flutter/material.dart';
import 'package:papi_network/models/get_team_api.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/my_app_bar.dart';

class SecurityCircle1 extends StatefulWidget {
  const SecurityCircle1({Key? key}) : super(key: key);

  @override
  State<SecurityCircle1> createState() => _SecurityCircle1State();
}

class _SecurityCircle1State extends State<SecurityCircle1> {
  List names = [
    'Ahmad Ali',
    'Ahsan zia',
    'Adnan Ali',
    'Ahmad Ali',
  ];

  List userNames = [
    '@Ahmadali123',
    '@Ahsanali123',
    '@Ahmadali123',
    '@Ahmadali123',
  ];
  List teamId = [];
  @override
  Widget build(BuildContext context) {
    print("teamid${teamId}");
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(imageName: 'GrayDown'),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: MyAppBar.appBar(context,
                txt: 'Security Circle',
                backGroundColor: AppColors.pinkPurpleAppBar,
                textAndIconsColor: Colors.white, onPressed: () {
              Navigator.pop(context);
            }),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text:
                              'Add your team member to  the security network Member you can add',
                        ),
                        TextSpan(
                          text: ' (3/7)',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ])),
                  15.sizeHeight,
                  FutureBuilder<GetTeamFromApiModel>(
                    future: AuthProvider().getTeamAPI(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.team!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(
                                      10,
                                    ),
                                    right: Radius.circular(10),
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 75,
                                      width: 85,
                                      decoration: BoxDecoration(
                                          color: AppColors.yellow,
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(10))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(10)),
                                        child: Image.asset(
                                          'assets/images/fullImage.png',
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  8.sizeHeight,
                                  Expanded(
                                    child: Container(
                                      height: 70,
                                      width: 240,
                                      padding: EdgeInsets.all(11),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data!.team!
                                                .elementAt(index)
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "@" +
                                                snapshot.data!.team!
                                                    .elementAt(index)
                                                    .userName
                                                    .toString(),
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      AppButton(
                                        gradient: index == 1 || index == 3
                                            ? LinearGradient(
                                                colors: [
                                                  AppColors.pink,
                                                  AppColors.blue
                                                ],
                                              )
                                            : LinearGradient(
                                                colors: [
                                                  Colors.green,
                                                  AppColors.blue
                                                ],
                                              ),
                                        radius: 5,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SecurityCircle1()));
                                          var addMember = AuthProvider()
                                              .addTeamMember(snapshot
                                                  .data!.team!
                                                  .elementAt(index)
                                                  .id)
                                              .then((value) {
                                            teamId.addAll(['id']);
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // FutureBuilder(
                                            //   future: AuthProvider()
                                            //       .addTeamMember(snapshot
                                            //           .data!.team!
                                            //           .elementAt(index)
                                            //           .id
                                            //           .toString()),
                                            //   builder: (context, snapshot) {
                                            //     if (snapshot.hasData) {
                                            //       return ListView.builder(
                                            //       //  itemCount: snapshot.data!.team.addTeam,
                                            //         itemBuilder: (context, index) {

                                            //       },)
                                            //     } else {
                                            //       return CircularProgressIndicator(
                                            //         color: AppColors
                                            //             .pinkPurpleAppBar,
                                            //       );
                                            //     }
                                            //   },
                                            // )

                                            Text(
                                              snapshot.data!.team!
                                                          .elementAt(index)
                                                          .addTeam ==
                                                      "1"
                                                  ? 'Added'
                                                  : 'Add',
                                            ),
                                          ],
                                        ),
                                        width: 80,
                                        height: 25,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 11,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppColors.pinkPurpleAppBar,
                        ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
