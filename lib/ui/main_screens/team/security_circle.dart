import 'package:flutter/material.dart';
import 'package:papi_network/models/get_team_api.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/ui/main_screens/team/security_circle_1.dart';
import 'package:papi_network/utils/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../invite_screen.dart';

class SecurityCircle extends StatefulWidget {
  const SecurityCircle({Key? key}) : super(key: key);

  @override
  State<SecurityCircle> createState() => _SecurityCircleState();
}

class _SecurityCircleState extends State<SecurityCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                    ),
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '    Your additional income coming from the security network',
                          style: TextStyle(fontSize: 10),
                        ),
                        LinearPercentIndicator(
                          lineHeight: 35,
                          percent: 0.2,
                          progressColor: AppColors.pink,
                          barRadius: Radius.circular(20),
                          center: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Safety factor-weak',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   height: 33,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(22),
                        //       color: Colors.grey),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '+0.04 mine papi/hr    ',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      // color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<GetTeamFromApiModel>(
                        future: AuthProvider().getTeamAPI(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              // physics: ScrollPhysics().maxFlingVelocity,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.team!.length,
                              itemBuilder: (context, index) {
                                if (snapshot.data!.team!
                                        .elementAt(index)
                                        .addTeam ==
                                    "1") {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                          right: Radius.circular(10),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: AppColors.yellow,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            10))),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(10)),
                                              child: Image.asset(
                                                'assets/images/fullImage.png',
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 60,
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                        InkWell(
                                          onTap: () {
                                            if (snapshot.data!.team!
                                                    .elementAt(index)
                                                    .addTeam ==
                                                "1") {
                                              var delRes = AuthProvider()
                                                  .deleteTeamMember(snapshot
                                                      .data!.team!
                                                      .removeAt(index)
                                                      .id);
                                              setState(() {
                                                Utils.flutterToast(
                                                    "Member deleted sucessfully");
                                              });
                                            } else {
                                              Utils.flutterToast(
                                                  "No member added yet");
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/icons/delete.png',
                                                height: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            );
                          }
                          //  else if (!snapshot.hasData) {
                          //   return Text(
                          //     'No one is in your security circle, please add someone you trust.',
                          //     style:
                          //         TextStyle(fontSize: 10, color: Colors.grey),
                          //   );
                          // }
                          else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.pinkPurpleAppBar,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: AppButton(
                    radius: 5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecurityCircle1()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add_alt),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Add existing team members'),
                      ],
                    ),
                    width: 300,
                    height: 35,
                  ),
                ),
                SizedBox(
                  height: 122,
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InviteScreen()));
                  },
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.person_add_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Earn extra 25% / active miner in your',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'team. Bonus rate uncapped.',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Start inviting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: AppColors.yellow),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
