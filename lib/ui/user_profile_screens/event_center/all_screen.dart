import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/papiFoot.png',
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Sky Zone',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '\$500,000 NFTs FOR FIRST TIME 10K',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'PAPIEERS BY SKY ZONE',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  // width: 111,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      AppColors.purpleTextColor,
                                      AppColors.pink
                                    ]),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      // shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.all(1.0),
                                        //   child: Image.asset(
                                        //     'assets/images/logoimage.png',
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   width: 11,
                                        // ),
                                        Text('NFT'),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(11)),
                              child: Image.asset(
                                'assets/images/papiFoot.png',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/papiFoot.png',
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Zam Camer',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '\$200,000 Coins and 1000 \$stars giveaway by Zam Camer',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 1,
                            ),
                            Spacer(),
                            Container(
                              // width: 111,
                              height: 15,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  AppColors.purpleTextColor,
                                  AppColors.pink
                                ]),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  // shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                        'assets/images/logoimage.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    Text('200000'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
