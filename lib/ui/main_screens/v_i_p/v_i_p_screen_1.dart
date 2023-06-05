import 'package:flutter/material.dart';
import 'package:papi_network/ui/main_screens/v_i_p/v_i_p_screen_2.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/bollet_title.dart';
import '../../../widgets/my_app_bar.dart';

class VIPScreen1 extends StatefulWidget {
  const VIPScreen1({Key? key}) : super(key: key);

  @override
  State<VIPScreen1> createState() => _VIPScreen1State();
}

class _VIPScreen1State extends State<VIPScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'Upgrade to Premium',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        // Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              22.sizeHeight,
              Image.asset(
                'assets/icons/vipScreensIcons/vip2.png',
                height: 60,
              ),
              30.sizeHeight,
              Container(
                height: 222,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.pink,
                      AppColors.blue,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current Plan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.red,
                          onTap: () {},
                          child: Container(
                            height: 28,
                            width: 111,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icons/vipScreensIcons/dollar.png',
                                  height: 17,
                                ),
                                Text(
                                  'Deposit',
                                  style: TextStyle(
                                      color: AppColors.purpleTextColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    1.sizeHeight,
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(text: 'Papi  '),
                          TextSpan(
                              text: '0.3',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(text: 'Earn  '),
                          TextSpan(
                              text: '0.3',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          TextSpan(text: '  Papi'),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(text: 'Earn  '),
                          TextSpan(
                              text: '0.3',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          TextSpan(text: '  USDT'),
                        ],
                      ),
                    ),
                    1.sizeHeight,
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(text: 'Validity period:  '),
                          TextSpan(
                              text: '0',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.amber)),
                          TextSpan(text: ' days'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              25.sizeHeight,
              Row(
                children: [
                  10.sizeWith,
                  BulletTitle(title: 'Boost your earning speed'),
                ],
              ),
              20.sizeHeight,
              secondCard(),
              20.sizeHeight,
              thirdCard(),
              20.sizeHeight,
            ],
          ),
        ),
      ),
    );
  }

  ///*************************************************************************
  ///******************************** Widget of the second card
  ///*************************************************************************

  Widget secondCard() {
    return Container(
      height: 222,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.pinkPurpleAppBar,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'VIP Plan 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  5.sizeHeight,
                  Text(
                    'USD      0.99',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.red,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VIPScreen2()));
                },
                child: Container(
                  height: 28,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/vip.png',
                        height: 17,
                      ),
                      Text(
                        'Upgrade Now',
                        style: TextStyle(
                            color: AppColors.purpleTextColor, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          22.sizeHeight,
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Daily Earn    '),
                TextSpan(
                    text: '0.85',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                TextSpan(text: '  Papi'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Daily Earn    '),
                TextSpan(
                    text: '0.01',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                TextSpan(text: '  USDT'),
              ],
            ),
          ),
          1.sizeHeight,
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Validity period:  '),
                TextSpan(
                    text: '30',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.amber)),
                TextSpan(text: ' days'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///*************************************************************************
  ///******************************** Widget of the third card
  ///*************************************************************************

  Widget thirdCard() {
    return Container(
      height: 222,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text(
                  'VIP Plan 2',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ]),
              InkWell(
                splashColor: Colors.red,
                onTap: () {},
                child: Container(
                  height: 28,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/vip.png',
                        height: 17,
                      ),
                      Text(
                        'Upgrade Now',
                        style: TextStyle(
                            color: AppColors.purpleTextColor, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          30.sizeHeight,
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Daily Earn    '),
                TextSpan(
                    text: '5',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                TextSpan(text: '  Papi'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Daily Earn    '),
                TextSpan(
                    text: '0.01',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                TextSpan(text: '  USDT'),
              ],
            ),
          ),
          1.sizeHeight,
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Validity period:  '),
                TextSpan(
                    text: '30',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.amber)),
                TextSpan(text: ' days'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
