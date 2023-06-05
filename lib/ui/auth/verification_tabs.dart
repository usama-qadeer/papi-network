import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/auth/email_login_verification.dart';
import 'package:papi_network/ui/auth/phone_login_verification.dart';
import 'package:papi_network/widgets/background_image.dart';
import 'package:papi_network/widgets/my_app_bar.dart';

class VerificationTabs extends StatefulWidget {
  int? iniIndex;
  VerificationTabs({required this.iniIndex, Key? key}) : super(key: key);

  @override
  State<VerificationTabs> createState() => _VerificationTabsState();
}

class _VerificationTabsState extends State<VerificationTabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = new TabController(
        initialIndex: widget.iniIndex!, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.iniIndex!,
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(),
            Scaffold(
              backgroundColor: Colors.transparent,

              appBar:
                  MyAppBar.appBar(context, txt: 'Verification', onPressed: () {
                Navigator.pop(context);
              }),
              // extendBodyBehindAppBar: true,
              body: Stack(
                children: [
                  Column(
                    children: [
                      TabBar(
                        unselectedLabelColor: AppColors.purpleTextColor,
                        labelColor: AppColors.purpleTextColor,
                        indicatorColor: AppColors.purpleTextColor,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                        tabs: const [
                          Tab(
                            // icon: Icon(Icons.check_circle),
                            child: Text('Phone'),
                          ),
                          // SizedBox(),
                          Tab(
                            // icon: Icon(Icons.add),
                            child: Text('Email'),
                          ),
                        ],
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            PhoneLoginVerification(),
                            EmailLoginVerification(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // extendBody: true,
              // bottomNavigationBar: Container(
              //   height: 60,
              //   width: double.infinity,
              //   decoration: const BoxDecoration(color: Colors.transparent),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       AppWidgets().myElevatedBTN(
              //         onPressed: () {
              //           print(FirebaseAuth.instance.currentUser!.uid);
              //           // Navigator.push(
              //           //     context,
              //           //     MaterialPageRoute(
              //           //         builder: (context) => AddProductScreen()));
              //           // Navigator.push(context,
              //           //   MaterialPageRoute(
              //           //     builder: (context) =>  AddProductScreen(),
              //           //   ),
              //           // );
              //         },
              //         btnText: 'Add Product',
              //         btnColor: AppColors.myRedColor,
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
