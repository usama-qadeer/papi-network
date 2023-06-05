import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/main_screens/wallet/blockchain.dart';
import 'package:papi_network/ui/main_screens/wallet/rewards.dart';

class WalletTabBar extends StatefulWidget {
  const WalletTabBar({Key? key}) : super(key: key);

  @override
  State<WalletTabBar> createState() => _WalletTabBarState();
}

class _WalletTabBarState extends State<WalletTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pinkPurpleAppBar,
        title: Text(''),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          // isScrollable: true,
          // // tabs: categoriesWidgets,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(horizontal: 0),
          indicatorWeight: 4,
          indicatorColor: Colors.white,

          tabs: [
            Tab(
              icon: ImageIcon(AssetImage('assets/icons/scane.png')),
            ),
            Tab(
              text: 'Blockchain',
            ),
            Tab(
              text: 'Rewards',
            ),
            Tab(
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text('data 1'),
          Blockchain(),
          Rewards(),
          Text('data 4'),
        ],
      ),
    );
  }
}
