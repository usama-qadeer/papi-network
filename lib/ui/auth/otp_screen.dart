import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papi_network/widgets/background_image.dart';
import 'package:papi_network/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/app_button.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  final Map data;
  const OTPScreen({Key? key, required this.verificationId, required this.data})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String otpCode = '0';

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

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
                const SizedBox(
                  height: 20,
                ),
                const Text(
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
                    fieldWidth: 40,
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
                      otpCode = verificationCode;

                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text("Verification Code"),
                      //         content:
                      //             Text('Code entered is $verificationCode'),
                      //       );
                      //     });
                    }, // end onSubmit
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                AppButton(
                  onPressed: () async {
                    final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpCode,
                    );

                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);

                      await authViewModel.registerApi(
                        context,
                        data: widget.data,
                      );
                    } catch (e) {
                      Utils.flutterToast(e.toString());
                    }

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => LoginTabs(
                    //               iniIndex: 0,
                    //             )));
                  },
                  child: authViewModel.loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('Confirm'),
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
