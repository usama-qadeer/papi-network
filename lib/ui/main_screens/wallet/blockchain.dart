import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';

class Blockchain extends StatefulWidget {
  const Blockchain({Key? key}) : super(key: key);

  @override
  State<Blockchain> createState() => _BlockchainState();
}

class _BlockchainState extends State<Blockchain>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 220,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Text('Premium Amount'), Icon(Icons.link)],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/eth.png',
                            height: 15,
                          ),
                          Text(' Ethereum Mainnet'),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '\$ 0.00',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 5,
                          height: 30,
                        ),
                        Text('0x01320875678589008'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.copy,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 28,
                        width: 125,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.pink,
                              AppColors.purpleTextColor
                            ]),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Container(
                            height: 25,
                            width: 122,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/icons/recieve.png',
                                  height: 16,
                                ),
                                Spacer(),
                                const Text(
                                  'Receive',
                                  style: TextStyle(
                                      color: AppColors.purpleTextColor),
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
                      Container(
                        height: 28,
                        width: 125,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.pink,
                              AppColors.purpleTextColor
                            ]),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Container(
                            height: 25,
                            width: 122,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/icons/send.png',
                                  height: 16,
                                ),
                                Spacer(),
                                Text(
                                  'Send',
                                  style: TextStyle(
                                      color: AppColors.purpleTextColor),
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
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              // isScrollable: true,
              // // tabs: categoriesWidgets,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.symmetric(horizontal: 0),
              indicatorWeight: 4,
              indicatorColor: AppColors.pink,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,

              tabs: [
                Tab(
                  text: 'Tokens',
                ),
                Tab(
                  text: 'Collection',
                ),
                Tab(
                  text: 'History',
                ),
              ],
            ),
            Container(
              height: 333,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 65,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/icons/eth.png',
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'ETH',
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('0'),
                                Text(
                                  '\$ 0.00',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward_ios_rounded),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Text(
                        'Don’t see your token?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Refresh List   or   Important Tokens',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Center(child: Text('data 2')),
                  Center(child: Text('data 3')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
