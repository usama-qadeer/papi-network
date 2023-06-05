import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papi_network/utils/extensions.dart';
import 'package:papi_network/widgets/background_image.dart';

import '../../constants/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/bordered_app_button.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              )),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundImage(imageName: 'Down'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    100.sizeHeight,
                    // SvgPicture.asset(
                    //   'assets/images/invite.svg',
                    //   // height: 150,
                    // ),
                    Image.asset(
                      'assets/images/invite.png',
                      height: 140,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      'Let’s Get Started',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purpleTextColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        'Invite your friends to join Papi Network with your invitation code',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      width: double.infinity,
                      // height: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColors.pink, AppColors.blue]),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '    hamidhs',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  // shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                child: Text(
                                  'Copy',
                                  style: TextStyle(
                                      color: AppColors.purpleTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    AppButton(
                      radius: 5,
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => RegisterScreen()));
                      },
                      child: Text('Invite your contacts'),
                      width: double.infinity,
                      // height: 35,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    BorderedAppButton(
                      radius: 5,
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginTabs(
                        //           iniIndex: 0,
                        //         )));
                      },
                      child: Text(
                        'Share',
                        style: TextStyle(color: AppColors.purpleTextColor),
                      ),
                      width: double.infinity,
                      // height: 35,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Terms of Services and Privacy Policy',
                      style: TextStyle(fontSize: 10),
                    ),

                    100.sizeHeight, 100.sizeHeight,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
