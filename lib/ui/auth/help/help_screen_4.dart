import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/auth/help/email_reset.dart';
import 'package:papi_network/ui/auth/help/phone_number_reset.dart';
import 'package:papi_network/widgets/my_app_bar.dart';

class HelpScreen4 extends StatefulWidget {
  bool showContainer;
  HelpScreen4({required this.showContainer, Key? key}) : super(key: key);

  @override
  State<HelpScreen4> createState() => _HelpScreen4State();
}

class _HelpScreen4State extends State<HelpScreen4> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: widget.iniIndex!,
      length: 2,
      child: Scaffold(
          appBar: MyAppBar.appBar(context,
              txt: 'Reset Password',
              backGroundColor: AppColors.pinkPurpleAppBar,
              textAndIconsColor: Colors.white, onPressed: () {
            Navigator.pop(context);
          }),
          // extendBodyBehindAppBar: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  Padding(
                    padding: EdgeInsets.all(27.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.showContainer = true;
                            });
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  'Phone Number Reset',
                                  style: TextStyle(
                                      color: AppColors.purpleTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                widget.showContainer == true
                                    ? Container(
                                        width: 135,
                                        height: 5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 21),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            AppColors.pink,
                                            AppColors.blue
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )
                                    : Container(
                                        width: 135,
                                        height: 5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 21),
                                      )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.showContainer = false;
                            });
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  'Email Reset',
                                  style: TextStyle(
                                      color: AppColors.purpleTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                widget.showContainer == false
                                    ? Container(
                                        width: 75,
                                        height: 5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 21),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            AppColors.pink,
                                            AppColors.blue
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )
                                    : Container(
                                        width: 75,
                                        height: 5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 21),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.showContainer == true
                      ? PhoneNumberReset()
                      : EmailReset(),
                ],
              ),
            ),
          )),
    );
  }

  Widget smallButton(
      {double? width = 100,
      double? height = 44,
      required VoidCallback? onPressed,
      required Widget? child}) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        // color: AppColors.pink,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: AppColors.pink,
          // shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: child,
      ),
    );
  }
}
