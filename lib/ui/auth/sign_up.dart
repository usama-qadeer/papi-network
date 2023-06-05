import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/auth/register_screen.dart';
import 'package:papi_network/ui/bottom_navigation_bar.dart';
import 'package:papi_network/ui/update_and_maintenance/update_screen.dart';
import 'package:papi_network/widgets/app_button.dart';
import 'package:papi_network/widgets/background_image.dart';
import 'package:papi_network/widgets/bordered_app_button.dart';

import 'login_tabs.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Contact Us"), value: "+92"),
    ];
    return menuItems;
  }

  String? countryPhoneCode;

  String? selectedValue;
  // List<DropdownMenuItem<String>> items = ['List', 'Request', 'Logging Details'];
  var dropdownValue = 'Please Select';

  String? selectedItem;
  List<String> list = [
    "Contact Us",
  ];

  bool contactShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        contactShow = !contactShow;
                      });
                    },
                    icon: Icon(
                      contactShow == false
                          ? Icons.more_vert
                          : Icons.cancel_outlined,
                      color: AppColors.purpleTextColor,
                    ),
                    splashRadius: 25),
                // Column(
                //   children: [
                //     Spacer(),
                //     Container(
                //       height: 50,
                //       width: 160,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: DropdownButtonFormField<String>(
                //         menuMaxHeight: 44,
                //
                //         // value: selectedItem,
                //         hint: SizedBox(),
                //         validator: (value) {
                //           if (value == null) {
                //             return 'Please select your gender';
                //           }
                //           return null;
                //         },
                //         items: list
                //             .map((e) => DropdownMenuItem<String>(
                //                   value: e,
                //                   child: Center(
                //                     child: Text(
                //                       e,
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                   ),
                //                 ))
                //             .toList(),
                //         borderRadius: BorderRadius.circular(15),
                //         onChanged: (String? value) {
                //           // dropdownValue = value!;
                //           if (value == 'List') {
                //             // Navigator.push(context,
                //             //     MaterialPageRoute(builder: (context) => CustomButtonTest()));
                //           }
                //         },
                //         icon: Icon(
                //           Icons.more_vert,
                //           color: AppColors.purpleTextColor,
                //         ),
                //
                //         dropdownColor: AppColors.blue,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(
                //             horizontal: 10,
                //             vertical: 10,
                //           ),
                //           errorBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(15),
                //             borderSide:
                //                 const BorderSide(color: Colors.transparent),
                //           ),
                //           focusedErrorBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(15),
                //             borderSide:
                //                 const BorderSide(color: Colors.transparent),
                //           ),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(15),
                //             borderSide:
                //                 const BorderSide(color: Colors.transparent),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide:
                //                 const BorderSide(color: Colors.transparent),
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           fillColor: Colors.transparent,
                //           filled: true,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            body: Stack(
              alignment: Alignment.topRight,
              children: [
                contactShow == false
                    ? SizedBox()
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Contact Us',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.purple),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        SizedBox(
                          height: 22,
                        ),
                        Spacer(),
                        Text(
                          'PAPI NETWORK',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: AppColors.purpleTextColor),
                        ),
                        Text(
                          'Committed to mining excellence',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.blueTextColor),
                        ),
                        Spacer(),
                        AppButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text('Sign Up'),
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        BorderedAppButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginTabs(
                                          iniIndex: 0,
                                        )));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: AppColors.blue),
                          ),
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateScreen()));
                            },
                            child: Text('test')),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavigationBarForApp()));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue as Guest',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.blueTextColor),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset(
                                'assets/icons/svg_icons/next.svg',
                                fit: BoxFit.fitWidth,
                                height: 26,
                                width: 26,
                              ),
                              // Image.asset(
                              //   'assets/icons/next.png',
                              //   height: 26,
                              // ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Continue with',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.blueTextColor),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/icons/svg_icons/google.png'),
                              height: 40,
                            ),
                            // SvgPicture.asset(
                            //   'assets/icons/svg_icons/google3.svg',
                            //   fit: BoxFit.fitWidth,
                            //   height: 40,
                            // ),
                            SizedBox(
                              width: 10.w,
                            ),
                            // Image(
                            //   image: AssetImage('assets/icons/facebook.png'),
                            //   height: 30,
                            // ),
                            SvgPicture.asset(
                              'assets/icons/svg_icons/facebook.svg',
                              fit: BoxFit.fitWidth,
                              height: 32,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
