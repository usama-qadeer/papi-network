import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:papi_network/ui/user_profile_screens/KYC_Verification/KYC_verification_2.dart';
import 'package:papi_network/utils/extensions.dart';
import 'package:papi_network/widgets/register_text_field.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';

class KYCVerification1 extends StatefulWidget {
  const KYCVerification1({Key? key}) : super(key: key);

  @override
  State<KYCVerification1> createState() => _KYCVerification1State();
}

class _KYCVerification1State extends State<KYCVerification1> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _yearDB = TextEditingController();
  final TextEditingController _monthDB = TextEditingController();
  final TextEditingController _dayDB = TextEditingController();

  String countryName = 'pakistan';
  String countryFlag = '🇵🇰';

  final viewInsets = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance.window.viewInsets,
      WidgetsBinding.instance.window.devicePixelRatio);

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
            child: Form(
              child: ListView(
                physics: BouncingScrollPhysics(),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.sizeHeight,
                  Text(
                    'Let’s get you verified',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  20.sizeHeight,
                  Text('Identity Information'),
                  26.sizeHeight,
                  Text(
                    ' Nationality',
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
                    ' Legal Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  LoginTextField(
                    controller: _firstName,
                    hintText: 'First Name',
                    title: 'n',
                  ),
                  5.sizeHeight,
                  LoginTextField(
                    controller: _middleName,
                    hintText: 'Middle Name',
                    title: 'n',
                  ),
                  5.sizeHeight,
                  LoginTextField(
                    controller: _lastName,
                    hintText: 'Last Name',
                    title: 'n',
                  ),
                  Text(
                    '   As shown on your passport or ID card',
                    style: TextStyle(fontSize: 11),
                  ),
                  34.sizeHeight,
                  Text(
                    ' Date of Birth',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LoginTextField(
                          myType: TextInputType.number,
                          controller: _yearDB,
                          hintText: 'YYYY',
                          title: 'n',
                        ),
                      ),
                      Expanded(
                        child: LoginTextField(
                          myType: TextInputType.number,
                          controller: _monthDB,
                          hintText: 'MM',
                          title: 'n',
                        ),
                      ),
                      Expanded(
                        child: LoginTextField(
                          myType: TextInputType.number,
                          controller: _dayDB,
                          hintText: 'DD',
                          title: 'n',
                        ),
                      ),
                    ],
                  ),
                  // EdgeInsets.fromViewPadding(
                  //                 WidgetsBinding.instance.window.viewInsets,
                  //                 WidgetsBinding.instance.window.devicePixelRatio)
                  //             .bottom ==
                  //         0
                  //     ? 0.sizeHeight
                  //     :
                  // 300.sizeHeight
                ],
              ),
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
                    width: 8,
                    decoration: BoxDecoration(
                        color: AppColors.pinkPurpleAppBar,
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
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(11)),
                  ),
                ],
              ),
              AppButton(
                radius: 8,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KYCVerification2()));
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
