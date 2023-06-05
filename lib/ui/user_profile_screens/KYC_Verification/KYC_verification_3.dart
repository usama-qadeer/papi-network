import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';

class KYCVerification3 extends StatefulWidget {
  const KYCVerification3({Key? key}) : super(key: key);

  @override
  State<KYCVerification3> createState() => _KYCVerification3State();
}

class _KYCVerification3State extends State<KYCVerification3> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  String countryName = 'pakistan';
  String countryFlag = '🇵🇰';

  bool bool1 = false;
  bool bool2 = false;
  bool bool3 = false;

  // final viewInsets = EdgeInsets.fromViewPadding(
  //     WidgetsBinding.instance.window.viewInsets,
  //     WidgetsBinding.instance.window.devicePixelRatio);

  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment(1, 0.65),
              child: Image.asset(
                'assets/images/Foots.png',
                height: 80,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.sizeHeight,
                Form(
                  child: Text(
                    'Let’s get you verified',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                // 20.sizeHeight,
                // Text('Identity Information'),
                27.sizeHeight,
                Text(
                  ' Document Issuing Country/Region',
                  style: TextStyle(fontSize: 11),
                ),
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8)),
                  child: phoneCodePicker(),
                ),
                34.sizeHeight,
                Text(
                  ' Document Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                8.sizeHeight,
                containerOfRadio(
                    title: 'Passport',
                    boolValue: bool1,
                    onTap: () {
                      setState(() {
                        bool1 = true;
                        bool2 = false;
                        bool3 = false;
                      });
                    }),
                8.sizeHeight,
                containerOfRadio(
                    title: 'Driver’s License',
                    boolValue: bool2,
                    onTap: () {
                      setState(() {
                        bool1 = false;
                        bool2 = true;
                        bool3 = false;
                      });
                    }),
                8.sizeHeight,
                containerOfRadio(
                    title: 'National ID',
                    boolValue: bool3,
                    onTap: () {
                      setState(() {
                        bool1 = false;
                        bool2 = false;
                        bool3 = true;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: EdgeInsets.only(top: 0, bottom: 43, left: 32, right: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 5,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  5.sizeWith,
                  Container(
                    height: 5,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  5.sizeWith,
                  Container(
                    height: 5,
                    width: 8,
                    decoration: BoxDecoration(
                        color: AppColors.pinkPurpleAppBar,
                        borderRadius: BorderRadius.circular(11)),
                  ),
                ],
              ),
              AppButton(
                radius: 8,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => KYCVerification2()));
                },
                child: Text('Next'),
                width: 158,
                height: 51,
              )
            ],
          ),
        ),
      ),
    );
  }

  ///*******************************************************
  ///*******************************************************
  ///****************  Country Name Picker  ****************
  ///*******************************************************
  ///*******************************************************

  Widget containerOfRadio(
      {required String title,
      required bool boolValue,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [AppColors.pinkPurpleAppBar, AppColors.blue])),
        padding: EdgeInsets.only(left: 40, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: boolValue ? AppColors.pink : Colors.white,
                      borderRadius: BorderRadius.circular(11)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///*******************************************************
  ///*******************************************************
  ///****************  Country Name Picker  ****************
  ///*******************************************************
  ///*******************************************************
  Widget phoneCodePicker() {
    return Container(
      height: 58,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
          height: 40,
          width: 70,
          child: InkWell(
              onTap: () {
                showCountryPicker(
                  countryListTheme:
                      CountryListThemeData(margin: EdgeInsets.only(top: 50)),
                  useSafeArea: true,
                  context: context,
                  showPhoneCode:
                      true, // optional. Shows phone code before the country name.
                  onSelect: (Country country) {
                    setState(() {
                      countryFlag = country.flagEmoji;
                      countryName = country.name;
                    });
                    debugPrint('Select country: ${country.flagEmoji}');
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
                        20.sizeWith,
                        Text(
                          countryFlag,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.purpleTextColor),
                        ),
                        12.sizeWith,
                        Text(
                          countryName,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        20.sizeWith,
                      ],
                    ),
                  )))),
    );
  }
}
