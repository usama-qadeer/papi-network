import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/register_text_field.dart';
import 'otp_screen.dart';

class PhoneLoginSecurityScreen extends StatefulWidget {
  const PhoneLoginSecurityScreen({Key? key}) : super(key: key);

  @override
  State<PhoneLoginSecurityScreen> createState() =>
      _PhoneLoginSecurityScreenState();
}

class _PhoneLoginSecurityScreenState extends State<PhoneLoginSecurityScreen> {
  String? countryPhoneCode = '92';
  String? countryName = 'Pakistan';

  final FocusNode unitCodeCtrlFocusNode = FocusNode();

  TextEditingController controller = TextEditingController();

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
          children: [
            Container(
              width: double.infinity,
              height: 65,
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
            AppButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTPSecurityScreen()));
              },
              child: Text('Next'),
              width: double.infinity,
            )
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
          height: 58,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                width: 11,
              ),

              /// Country Phone Code
              SizedBox(
                  height: 40,
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
                child: LoginTextField(
                  controller: controller,
                  focusNode: unitCodeCtrlFocusNode,
                  hintText: 'Phone Number',
                  title: 'n',
                  myType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
