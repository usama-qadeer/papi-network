import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:papi_network/models/get_mining_setting_model.dart';
import 'package:papi_network/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../constants/app_colors.dart';
import '../../../view_model/get_minning_setting_view_model.dart';
import '../invite_widget.dart';
import '../wallet/wallet3.dart';
import 'home_page_news.dart';
import 'home_page_team.dart';

class HomePageShowCase extends StatelessWidget {
  const HomePageShowCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            ShowCaseWidget(builder: Builder(builder: (context) => HomePage())));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _one1 = GlobalKey();
  final GlobalKey _two2 = GlobalKey();

  var formatter = NumberFormat('#,###,00');
  double value = 12000;

  final ScrollController _scrollingController = ScrollController();
  GetMiningSettingViewModel getMiningSettingViewModel =
      GetMiningSettingViewModel();

  @override
  void initState() {
    getMiningSettingViewModel.fetchMiningSettingApi();

    // WidgetsBinding.instance.addPostFrameCallback(
    //     (_) => ShowCaseWidget.of(context).startShowCase([_one1, _two2]));

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   double minScrollExtent = _scrollingController.position.minScrollExtent;
    //   double maxScrollExtent = _scrollingController.position.maxScrollExtent;
    //
    //   animateToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 5,
    //       _scrollingController);
    // });

    super.initState();
  }

  @override
  void dispose() {
    _scrollingController.dispose();
    super.dispose();
  }

  /// My Function of forward and backward scrolling animation
  // animateToMaxMin(double max, double min, double direction, int seconds,
  //     ScrollController scrollController) {
  //   scrollController
  //       .animateTo(direction,
  //           duration: Duration(seconds: seconds), curve: Curves.linear)
  //       .then((value) {
  //     direction = direction == max ? min : max;
  //     animateToMaxMin(max, min, direction, seconds, scrollController);
  //   });
  // }

  /// My Function of show case view
  displayShowCase() async {
    final sp = await SharedPreferences.getInstance();
    bool? showCaseVisibility = sp.getBool("displayShowcase");

    if (showCaseVisibility == null) {
      sp.setBool("displayShowcase", false);
      return true;
    }
    return false;
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              alignment: Alignment.bottomCenter,
              content: Text("hi"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    displayShowCase().then((value) {
      if (value) {
        ShowCaseWidget.of(context).startShowCase([_one1, _two2]);
      }
    });
    // Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[AppColors.pink, AppColors.gradiant2])),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'minipapi.com',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            height: 33,
            width: 33,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/notification.png',
                height: 22,
              ),
            ),
          ),
          Container(
            height: 33,
            width: 33,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/winnings.png',
                height: 22,
              ),
            ),
          ),
          Container(
            height: 33,
            width: 33,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/privacy.png',
                height: 22,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 380,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/frame.png',
                        // width: size.width / 1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    40.sizeHeight
                  ],
                ),
                Positioned(
                  bottom: -5,
                  left: size.width / 3,
                  right: size.width / 3,
                  child: Center(
                      child: Showcase(
                    tooltipPosition: TooltipPosition.top,
                    disposeOnTap: true,
                    onTargetClick: () {
                      print(
                          'objectobject      Click button      objectobject      ');
                    },
                    key: _one1,
                    tooltipBackgroundColor: Colors.black,
                    textColor: AppColors.pink,
                    title: 'Tap to start earning',
                    description: '',
                    targetPadding: EdgeInsets.all(-8),
                    targetBorderRadius: BorderRadius.circular(55.0),
                    // titleAlignment: TextAlign.center,
                    // descriptionAlignment: TextAlign.center,
                    tooltipPadding:
                        EdgeInsets.only(top: 15, left: 13, right: 15),
                    child: InkWell(
                      onTap: () {
                        Mining();
                        print(
                            'objectobject      Click button      objectobject      ');
                      },
                      child: SvgPicture.asset(
                        'assets/images/papiFoot.svg',
                        height: 90,
                        width: 90,
                      ),
                    ),
                  )

                      // Image.asset(
                      //   'assets/images/papiFoot.png',
                      //   // width: size.width / 1,
                      // ),
                      ),
                ),
                Positioned(
                  bottom: -5,
                  left: size.width / 3,
                  right: size.width / 3,
                  child: Center(
                    child: Showcase(
                        key: _two2,
                        showArrow: false,
                        disableMovingAnimation: true,
                        tooltipBackgroundColor: Colors.black,
                        textColor: AppColors.pink,
                        // targetPadding: EdgeInsets.all(-8),
                        targetBorderRadius: BorderRadius.circular(55.0),
                        // titleAlignment: TextAlign.center,
                        // descriptionAlignment: TextAlign.center,
                        tooltipPadding: EdgeInsets.all(15),
                        description:
                            'You will activate a 24 hour earning session. It will grow your balancing figure depending on the number of active palyer in your team.',
                        child: SizedBox()),
                  ),
                ),

                // Column(
                //   children: [
                //     Container(
                //       height: size.height / 3,
                //       padding: EdgeInsets.symmetric(vertical: 16, horizontal: 21),
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //             colors: [AppColors.pink, AppColors.blue]),
                //       ),
                //     ),
                //     Container(
                //       height: size.height / 5,
                //       padding: EdgeInsets.symmetric(vertical: 16, horizontal: 21),
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //             colors: [AppColors.pink, AppColors.blue]),
                //         borderRadius:
                //             BorderRadius.vertical(bottom: Radius.circular(666)
                //                 // bottomLeft: Radius.circular(144),
                //                 // bottomRight: Radius.circular(144)
                //                 ),
                //       ),
                //     ),
                //   ],
                // ),

                Center(
                  heightFactor: 0.9,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wallet3()));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 230,
                            width: 230,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 21),
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.w, vertical: 70.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(140),
                                color: Colors.grey.shade400),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Balance',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  // Text(
                                  //   '1,200,00',
                                  //   style: TextStyle(
                                  //       fontSize: 30,
                                  //       fontWeight: FontWeight.bold,
                                  //       color: AppColors.pink),
                                  // ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // ChangeNotifierProvider<
                                  //     GetMiningSettingViewModel>(
                                  //   create: (BuildContext context) =>
                                  //       getMiningSettingViewModel,
                                  //   child: Consumer<GetMiningSettingViewModel>(
                                  //     builder: (context, value, child) {
                                  //       switch (
                                  //           value.miningSettingData.status) {
                                  //         case Status.LOADING:
                                  //           return Center(
                                  //               child:
                                  //                   CircularProgressIndicator());
                                  //         case Status.ERROR:
                                  //           return Center(
                                  //               child: Text(value
                                  //                   .miningSettingData.message
                                  //                   .toString()));
                                  //         case Status.COMPLETED:
                                  //           var data = value
                                  //               .miningSettingData.data!.mining;
                                  //
                                  //           double tokenPerHr = double.parse(
                                  //                   data!.token.toString()) /
                                  //               double.parse(
                                  //                   data!.time.toString());
                                  //
                                  //           return Center(
                                  //             child: Text(
                                  //               '+${tokenPerHr.toString().substring(0, 6)}/hr',
                                  //               style: TextStyle(
                                  //                   fontSize: 16,
                                  //                   fontWeight: FontWeight.bold,
                                  //                   color: AppColors.blue),
                                  //             ),
                                  //           );
                                  //       }
                                  //       return Container();
                                  //     },
                                  //   ),
                                  // ),
                                  Text(
                                    '+0.00/hr',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blue),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_outline_rounded,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '2/10',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              angleRange: 360,
                              startAngle: 270,
                              customWidths: CustomSliderWidths(
                                progressBarWidth: 10,
                                shadowWidth: 44,
                              ),
                              size: 280,
                              customColors: CustomSliderColors(
                                dotColor: Colors.red,
                                trackColor: Colors.grey.shade400,
                                progressBarColor: Colors.amber,
                                shadowColor: Color(0xffFFCF3E),
                                shadowMaxOpacity: 0.1,
                              )),
                          min: 10,
                          max: 150000,
                          initialValue: value,
                          onChange: (val) {
                            print(val);
                            // setState(() {
                            //   value = val;
                            // });
                          },
                          innerWidget: (value) {
                            return Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Text(
                                    formatter.format(value.toInt()).toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.pink),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 33,
                    width: 33,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/chat.png',
                        height: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '12:22:28',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 32,
              width: double.infinity,
              color: AppColors.pink,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const ImageIcon(
                    AssetImage('assets/icons/notification.png'),
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    // scrolling animation
                    child: SingleChildScrollView(
                      controller: _scrollingController,
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        'Your Latest notification will appear here.  Your Latest notification will appear here.',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  // Spacer(),

                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Your Latest',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text('A banner Slider')),
                  ),
                  InviteWidget(),
                  HomePageTeam(),
                  HomePageNews()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
