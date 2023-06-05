import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({Key? key}) : super(key: key);

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
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
