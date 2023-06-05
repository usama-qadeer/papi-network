import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../utils/utils.dart';
import '../../widgets/app_button.dart';
import '../../widgets/register_text_field.dart';
import 'forget_password_otp.dart';

class PhoneLoginVerification extends StatefulWidget {
  const PhoneLoginVerification({Key? key}) : super(key: key);

  @override
  State<PhoneLoginVerification> createState() => _PhoneLoginVerificationState();
}

class _PhoneLoginVerificationState extends State<PhoneLoginVerification> {
  String? countryPhoneCode = '92';
  String? countryName = 'Pakistan';

  final FocusNode unitCodeCtrlFocusNode = FocusNode();

  TextEditingController controller = TextEditingController();

  final ValueNotifier<bool> _loaderForOTP = ValueNotifier<bool>(false);
  @override
  void initState() {
    unitCodeCtrlFocusNode.requestFocus();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify',
              style: TextStyle(color: AppColors.blue, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 59,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [AppColors.pink, AppColors.blue]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: phoneCodePicker(),

                  // CustomTextField(
                  //     hintText: '+92  Phone Number', title: 'n'),
                ),
              ),
            ),
            Spacer(),
            ValueListenableBuilder(
                valueListenable: _loaderForOTP,
                builder: (context, value, child) {
                  return AppButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        _loaderForOTP.value = true;
                        Map data = {
                          'phone': '+$countryPhoneCode${controller.text}'
                        };

                        FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+$countryPhoneCode${controller.text}',
                          verificationCompleted: (_) {},
                          verificationFailed: (e) {
                            // authProvider.setLoading(false);
                            Utils.flutterToast(
                                'verificationFailed: ' + e.toString());
                            _loaderForOTP.value = false;
                          },
                          codeSent: (String verification, int? token) {
                            _loaderForOTP.value = false;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPasswordOTP(
                                          emailOtpVerification: '',
                                          data: data,
                                          id: 'sdf',
                                          phoneOtpVerification: verification,
                                          phoneOrEmailAddress:
                                              '+$countryPhoneCode${controller.text}',
                                        )));

                            Utils.flutterToast('Code Sent');
                          },
                          codeAutoRetrievalTimeout: (e) {
                            // authProvider.setLoading(false);
                            Utils.flutterToast(
                                'codeAutoRetrievalTimeout: ' + e.toString());
                            _loaderForOTP.value = false;
                          },
                        );
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PasswordScreen(
                        //           phone: '+$countryPhoneCode${controller.text}',
                        //         )));
                      } else {
                        Utils.flutterToast('enter your phone number');
                      }
                    },
                    width: double.infinity,
                    child: _loaderForOTP.value == false
                        ? Text('Send Code')
                        : CircularProgressIndicator(
                            color: Colors.white,
                          ),
                  );
                })
          ],
        ),
      ),
    );
  }

  ///**********************   Phone Code Picker   ********************

  Widget phoneCodePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 11,
              ),

              /// Country Phone Code
              SizedBox(
                  // height: 40,
                  width: 70,
                  child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          countryListTheme: CountryListThemeData(
                              margin: EdgeInsets.only(top: 50)),
                          useSafeArea: true,
                          context: context,
                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            setState(() {
                              countryPhoneCode = country.phoneCode;
                              countryName = country.name;
                            });
                            debugPrint('Select country: ${country.phoneCode}');
                            debugPrint('Select country: ${country.name}');
                          },
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '+ $countryPhoneCode',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.purpleTextColor),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.purpleTextColor,
                                )
                              ],
                            ),
                          )))),

              Expanded(
                child: SizedBox(
                  height: 48,
                  child: LoginTextField(
                    focusNode: unitCodeCtrlFocusNode,
                    hintText: 'Phone Number',
                    title: 'n',
                    myType: TextInputType.number,
                    controller: controller,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
