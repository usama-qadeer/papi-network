import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class NFTScreen extends StatefulWidget {
  const NFTScreen({Key? key}) : super(key: key);

  @override
  State<NFTScreen> createState() => _NFTScreenState();
}

class _NFTScreenState extends State<NFTScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
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
          );
        },
      ),
    );
  }
}
