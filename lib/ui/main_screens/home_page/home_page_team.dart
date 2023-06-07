import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/widgets/bollet_title.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class HomePageTeam extends StatefulWidget {
  const HomePageTeam({Key? key}) : super(key: key);

  @override
  State<HomePageTeam> createState() => _HomePageTeamState();
}

class _HomePageTeamState extends State<HomePageTeam> {
  late var homepageTeam = Provider.of<AuthProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BulletTitle(title: 'Team'),
              const Spacer(),
              const Text(
                'more',
                style: TextStyle(fontSize: 12, color: AppColors.pink),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.pink,
                size: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 111,
            child: FutureBuilder(
              // scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              future: homepageTeam.getTeamAPI(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  decoration: new BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  alignment: Alignment.center,
                                  height: 130,
                                  child: Image.asset(
                                    'assets/images/fullImage.png',
                                    fit: BoxFit.fill,
                                    height: 70,
                                  )),
                              // Positioned(
                              //   right: 5,
                              //   top: 10,
                              //   child: Stack(
                              //     alignment: Alignment.center,
                              //     children: [
                              //       Container(
                              //         height: 15,
                              //         width: 15,
                              //         decoration: BoxDecoration(
                              //             color: Colors.black,
                              //             borderRadius:
                              //                 BorderRadius.circular(22)),
                              //       ),
                              //       Icon(
                              //         Icons.check_circle,
                              //         color: AppColors.yellow,
                              //         size: 20,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Positioned(
                                  right: 8,
                                  bottom: 15,
                                  child: Container(
                                    height: 11,
                                    width: 11,
                                    decoration: BoxDecoration(
                                        // color: index.isEven
                                        //     ? Colors.red
                                        //     : Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                  )),
                            ],
                          ),
                        ),
                        Text(
                          data.team!.last.name.toString(),
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator(
                    color: AppColors.pinkPurpleAppBar,
                  );
                }
              },
            ),
          ),
          // FutureBuilder(
          //   future: AuthProvider().getTeamAPI(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return SizedBox(
          //           height: 550,
          //           child: ListView.builder(
          //             itemBuilder: (BuildContext context, int index) {
          //               return Text(snapshot.data!.team!
          //                   .elementAt(index)
          //                   .name
          //                   .toString());
          //             },
          //           ));
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
