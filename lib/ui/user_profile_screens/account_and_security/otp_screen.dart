import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papi_network/widgets/background_image.dart';
import 'package:papi_network/widgets/my_app_bar.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';

class OTPSecurityScreen extends StatefulWidget {
  const OTPSecurityScreen({Key? key}) : super(key: key);

  @override
  State<OTPSecurityScreen> createState() => _OTPSecurityScreenState();
}

class _OTPSecurityScreenState extends State<OTPSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context, txt: '', onPressed: () {
        Navigator.pop(context);
      }),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundImage(),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please verify your OTP',
                  style:
                      TextStyle(fontSize: 16, color: AppColors.blueTextColor),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 44,
                  child: OtpTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    fieldWidth: 44,
                    // focusedBorderColor: Colors.green,
                    disabledBorderColor: Colors.blue,
                    enabledBorderColor: Colors.blue,
                    fillColor: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    numberOfFields: 6,
                    borderColor: Colors.black,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                AppButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                  },
                  child: Text('Confirm'),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
