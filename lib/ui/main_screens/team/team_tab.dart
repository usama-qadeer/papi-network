import 'package:flutter/material.dart';
import 'package:papi_network/models/get_team_api.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../providers/auth_provider.dart';

class TeamTab extends StatefulWidget {
  const TeamTab({Key? key}) : super(key: key);

  @override
  State<TeamTab> createState() => _TeamTabState();
}

class _TeamTabState extends State<TeamTab> {
  List names = [
    'Ahmad Ali',
    'Ahsan zia',
    'Adnan Ali',
    'Ahmad Ali',
    'Name',
  ];

  List userNames = [
    '@Ahmadali123',
    '@Ahsanali123',
    '@Ahmadali123',
    '@Ahmadali123',
    '@Ahmadali123',
  ];
  late var teamData = Provider.of<AuthProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'You have invited',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '0  pioneer(s)',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      'Your team has',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '0  member(s)',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      'Currently earning',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '0  active member(s)',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              const Text(
                'No more',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              const SizedBox(
                height: 6,
              ),
              // FutureBuilder(
              //   future: teamData.getTeamAPI(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       var data = snapshot.data!;
              //       return Row(
              //         children: [
              //           Text(
              //             data.team!.length.toString(),
              //           ),
              //           Text(
              //             data.team!.first.name.toString(),
              //           ),
              //         ],
              //       );
              //     }
              //     return const CircularProgressIndicator();
              //   },
              // ),
              FutureBuilder(
                // physics: const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                future: AuthProvider().getTeamAPI(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    //  var data = snapshot.data!;
                    return SizedBox(
                      height: 550,
                      child: ListView.builder(
                        itemCount: snapshot.data!.team!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10),
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
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
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
                                // Column(
                                //   children: [
                                //     Row(
                                //       children: [
                                //         Text(index == 2 ? 'active' : 'Inactive'),
                                //         SizedBox(
                                //           width: 5,
                                //         ),
                                //         Container(
                                //           height: 7,
                                //           width: 7,
                                //           decoration: BoxDecoration(
                                //               color: index == 2
                                //                   ? Colors.green
                                //                   : Colors.red,
                                //               borderRadius:
                                //                   BorderRadius.circular(11)),
                                //         )
                                //       ],
                                //     ),
                                //     SizedBox(
                                //       height: 10,
                                //     ),
                                //     Container(
                                //       width: 80,
                                //       height: 25,
                                //       decoration: BoxDecoration(
                                //         gradient: LinearGradient(
                                //             colors: [AppColors.pink, AppColors.blue]),
                                //         borderRadius: BorderRadius.circular(5),
                                //       ),
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(0.5),
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //             borderRadius: BorderRadius.circular(5),
                                //           ),
                                //           child: ElevatedButton(
                                //             onPressed: () {},
                                //             style: ElevatedButton.styleFrom(
                                //               elevation: 0,
                                //               backgroundColor: Colors.white,
                                //               // shadowColor: Colors.transparent,
                                //               shape: RoundedRectangleBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(5),
                                //               ),
                                //             ),
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.spaceBetween,
                                //               children: [
                                //                 ImageIcon(
                                //                   AssetImage(
                                //                     'assets/icons/clock.png',
                                //                   ),
                                //                   color: AppColors.purpleTextColor,
                                //                   size: 15,
                                //                 ),
                                //                 Text(
                                //                   'Ping',
                                //                   style: TextStyle(
                                //                       color:
                                //                           AppColors.purpleTextColor),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),

                                SizedBox(
                                  width: 11,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
    );
  }
}
