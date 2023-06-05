import 'package:flutter/material.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/bollet_title.dart';
import '../../../widgets/my_app_bar.dart';

class VIPScreen2 extends StatefulWidget {
  const VIPScreen2({Key? key}) : super(key: key);

  @override
  State<VIPScreen2> createState() => _VIPScreen2State();
}

class _VIPScreen2State extends State<VIPScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'VIP plan 1  ',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              22.sizeHeight,
              Row(
                children: [
                  10.sizeWith,
                  BulletTitle(title: 'VIP Details'),
                ],
              ),
              arrowTitle(txt: 'USD  0.99'),
              arrowTitle(txt: 'Daily Earn  0.85 Papi'),
              arrowTitle(txt: 'Daily Earn  0.01 USD'),
              arrowTitle(txt: 'Valid Period  30 days'),
              22.sizeHeight,
              Row(
                children: [
                  10.sizeWith,
                  BulletTitle(title: 'VIP Privileges'),
                ],
              ),
              20.sizeHeight,
              myTile(
                txt: 'Transaction',
                onTap: () {},
                iconPath: 'assets/icons/vipScreensIcons/Transaction.png',
              ),
              myTile(
                txt: 'Voucher Screenshot',
                onTap: () {},
                iconPath: 'assets/icons/vipScreensIcons/screenshot.png',
              ),
              myTile(
                txt: 'Sender Name',
                onTap: () {},
                iconPath: 'assets/icons/vipScreensIcons/person.png',
              ),
              myTile(
                txt: 'Amount',
                onTap: () {},
                iconPath: 'assets/icons/vipScreensIcons/amount.png',
              ),
              myTile(
                txt: 'Other Details',
                onTap: () {},
                iconPath: 'assets/icons/vipScreensIcons/other.png',
              ),
              20.sizeHeight,
              Row(
                children: [
                  10.sizeWith,
                  BulletTitle(title: 'VIP Details'),
                ],
              ),
              5.sizeHeight,
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'You can even use verbs as describing words - although You can even use verbs as describing words - although You can even use verbs as describing words - although',
                  // textAlign: TextAlign.justify,
                ),
              ),
              20.sizeHeight,
              Row(
                children: [
                  10.sizeWith,
                  BulletTitle(title: 'Terms & Conditions'),
                ],
              ),
              5.sizeHeight,
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'You can even use verbs as describing words - although You can even use verbs as describing words - although You can even use verbs as describing words - although You can even use verbs as describing words - although',
                  // textAlign: TextAlign.justify,
                ),
              ),
              30.sizeHeight,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 40.0, right: 40, bottom: 30, top: 0),
        child: AppButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0)), //this right here
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border:
                        //     Border.all(color: Colors.blue, width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 67,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      color: AppColors.pinkPurpleAppBar),
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
                                  'Are you sure you want to buy this plan?',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'CANCEL',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.purpleTextColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                AppButton(
                                  radius: 22,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('BUY NOW'),
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
          child: Text('Upgrade Now'),
          width: double.infinity,
        ),
      ),
    );
  }

  ///*************************************************************************
  ///******************************** Widget of the Arrow Title
  ///*************************************************************************

  Widget arrowTitle({
    required String? txt,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/vipScreensIcons/arrowForward.png',
            height: 8,
          ),
          5.sizeWith,
          Text(
            txt!,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  ///*************************************************************************
  ///******************************** Widget of Tile
  ///*************************************************************************

  Widget myTile(
      {required String? txt,
      required String? iconPath,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              AppColors.pink,
              AppColors.blue,
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            27.sizeWith,
            Image.asset(
              iconPath!,
              height: 40,
              width: 40,
              color: Colors.white,
            ),
            27.sizeWith,
            Text(
              txt!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
