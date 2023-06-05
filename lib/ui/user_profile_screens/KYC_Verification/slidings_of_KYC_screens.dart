import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/user_profile_screens/KYC_Verification/KYC_verification_1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../widgets/app_button.dart';

class SlidingsOfKYCScreens extends StatefulWidget {
  const SlidingsOfKYCScreens({Key? key}) : super(key: key);

  @override
  State<SlidingsOfKYCScreens> createState() => _SlidingsOfKYCScreensState();
}

class _SlidingsOfKYCScreensState extends State<SlidingsOfKYCScreens> {
  final _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    //   dotHeight: 5.0,
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pinkPurpleAppBar,
        centerTitle: true,
        title: Text('KYC Verification'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
              alignment: Alignment(1, 0.7),
              child: Image.asset(
                'assets/images/Foots.png',
                height: 80,
              )),
          PageView(
            controller: _pageViewController,
            children: [
              KYCVerification1(),
              Center(child: Text('data 2')),
              Center(child: Text('data 3')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
                alignment: Alignment(0, 0.92),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                        controller: _pageViewController,
                        count: 3,
                        effect:
                            /*CustomizableEffect(

                          dotDecoration:
                              DotDecoration(width: 44, color: Colors.red),
                          activeDotDecoration:
                              DotDecoration(width: 11, color: Colors.green)),*/
                            ExpandingDotsEffect(
                                activeDotColor: AppColors.pinkPurpleAppBar,
                                radius: 11,
                                spacing: 5,
                                expansionFactor: 3,
                                dotWidth: 10,
                                dotHeight: 8)
                        // WormEffect()
                        // SlideEffect(),
                        ),
                    AppButton(
                      radius: 8,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Next'),
                      width: 158,
                      height: 51,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
