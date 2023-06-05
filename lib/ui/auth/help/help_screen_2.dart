import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/auth/help/help_screen_6.dart';
import 'package:papi_network/widgets/app_text_field.dart';
import 'package:papi_network/widgets/my_app_bar.dart';

import '../../../widgets/app_button.dart';
import '../login_tabs.dart';

class HelpScreen2 extends StatefulWidget {
  const HelpScreen2({Key? key}) : super(key: key);

  @override
  State<HelpScreen2> createState() => _HelpScreen2State();
}

class _HelpScreen2State extends State<HelpScreen2> {
  String? countryPhoneCode = '92';
  String? countryName = 'Pakistan';

  int _groupValue = -1;
  bool firstBool = false;
  bool secondBool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'Restore Account (1/2)',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginTabs(
              iniIndex: 0,
            ),
          ),
        );
      }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    firstBool == false
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                firstBool = !firstBool;
                              });
                            },
                            child: singleTitlesWidget(
                              title: 'I remember my invitation code',
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: AppColors.pinkShade,

                                // border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'I remember my invitation code',
                                      style: TextStyle(
                                          color: AppColors.purpleTextColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          firstBool = !firstBool;
                                        });
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                AppTextField(hintText: 'Invitation Code')
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    secondBool == false
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                secondBool = !secondBool;
                              });
                            },
                            child: singleTitlesWidget(
                              title: 'I forgot my invitation code',
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelpScreen6()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  // border: Border.all(),
                                  color: AppColors.pinkShade,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'I forgot my invitation code',
                                        style: TextStyle(
                                            color: AppColors.purpleTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            secondBool = !secondBool;
                                          });
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_up,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Bound info (select one):',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  myRadioButton(
                                      title: 'Phone Number',
                                      value: 0,
                                      onChanged: (newVal) {
                                        setState(() {
                                          _groupValue = newVal!;
                                        });
                                      }),
                                  phoneCodePicker(),
                                  // AppTextField(hintText: 'Phone Number'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  myRadioButton(
                                      title: 'Linked email address',
                                      value: 1,
                                      onChanged: (newVal) {
                                        setState(() {
                                          _groupValue = newVal!;
                                        });
                                      }),
                                  AppTextField(hintText: 'email address'),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 11,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 35),
        child: AppButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginTabs(
                          iniIndex: 0,
                        )));
          },
          child: Text('Confirm'),
          width: double.infinity,
        ),
      ),
    );
  }

  ///***********************  Single Titles Widget **********************
  Widget singleTitlesWidget({
    required String? title,
  }) {
    return Container(
      width: double.infinity,
      // height: 22,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 21),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.pink, AppColors.blue]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          )
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

  ///***********************  My Radio Button **********************

  Widget myRadioButton(
      {required String? title,
      required int value,
      required Function(int?) onChanged}) {
    return RadioListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      activeColor: AppColors.purpleTextColor,
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title!),
    );
  }
}
