import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:papi_network/ui/main_screens/home_page/home_page.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';

class PhoneNumberReset extends StatefulWidget {
  const PhoneNumberReset({Key? key}) : super(key: key);

  @override
  State<PhoneNumberReset> createState() => _PhoneNumberResetState();
}

class _PhoneNumberResetState extends State<PhoneNumberReset> {
  // Country Code
  String? countryPhoneCode = '92';
  String? countryName = 'Pakistan';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.6,
      child: Column(
        children: [
          phoneCodePicker(),
          SizedBox(
            height: 11,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  hintText: 'Enter verification code',
                ),
              ),
              smallButton(onPressed: () {}, child: Text('Send Code'))
            ],
          ),
          SizedBox(
            height: 33,
          ),
          AppTextField(
            hintText: 'Enter a new password',
          ),
          SizedBox(
            height: 11,
          ),
          AppTextField(
            hintText: 'Enter again to confirm your password',
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(3),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(11)),
              ),
              Expanded(
                child: Text(
                  'Use 8 to 20 character with a mix of letters, numbers & symbols, nospaces',
                  style: TextStyle(
                      color: AppColors.purpleTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          Spacer(),
          AppButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Complete'),
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  ///**********************   Phone Code Picker   ********************

  Widget phoneCodePicker() {
    return Container(
      // height: 61,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),

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
            child: TextField(
              decoration: InputDecoration(
                hintText: '',
                hintStyle: TextStyle(color: Colors.black),
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///********************************************************

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
