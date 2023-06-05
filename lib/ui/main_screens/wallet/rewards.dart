import 'package:flutter/material.dart';
import 'package:papi_network/utils/dashes_line.dart';

import '../../../constants/app_colors.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 220,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Container(
                      height: 88,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Account Balance',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Coin(s)',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 8),
                              ),
                              Text(
                                'Estimate:  0USD',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 8),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              height: 25,
                              width: 95,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const ImageIcon(
                                    AssetImage(
                                      'assets/icons/withdraw.png',
                                    ),
                                    size: 18,
                                  ),
                                  Text(
                                    'Withdraw',
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                        child: Dash(
                      length: size.width / 1.3,
                      dashColor: Colors.grey,
                    )),
                    Container(
                      height: 87,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Cumulative Team Reward',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Coin(s)',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 8),
                              ),
                            ],
                          ),
                          Container(
                            height: 28,
                            width: 98,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  AppColors.pink,
                                  AppColors.purpleTextColor
                                ]),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Container(
                                height: 25,
                                width: 95,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.group_outlined,
                                      color: Colors.purple,
                                    ),
                                    Spacer(),
                                    Text(
                                      'Ping Team',
                                      style: TextStyle(
                                          color: AppColors.purpleTextColor,
                                          fontSize: 10),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Record',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Container(
                height: 220,
                margin: EdgeInsets.only(top: 2, bottom: 2),
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: Text(
                  'No record yet, earn coin(S) now!',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
