import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:papi_network/ui/user_profile_screens/KYC_Verification/KYC_verification_3.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/register_text_field.dart';

class KYCVerification2 extends StatefulWidget {
  const KYCVerification2({Key? key}) : super(key: key);

  @override
  State<KYCVerification2> createState() => _KYCVerification2State();
}

class _KYCVerification2State extends State<KYCVerification2> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _city = TextEditingController();

  String countryName = 'pakistan';
  String countryFlag = '🇵🇰';

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
                    'Home Address',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                20.sizeHeight,
                Text('Ensure this is your current residential address '),
                26.sizeHeight,

                34.sizeHeight,
                Text(
                  ' Full Address',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                addressTextField(
                    obscureText: false,
                    controller: _address,
                    myType: TextInputType.multiline,
                    hintText: 'Enter your residential address '),
                15.sizeHeight,
                Text(
                  ' Postal Code',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                LoginTextField(
                  myType: TextInputType.number,
                  controller: _postalCode,
                  hintText: 'Enter Postal Code',
                  title: 'n',
                ),
                15.sizeHeight,
                Text(
                  ' City',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                LoginTextField(
                  controller: _city,
                  hintText: 'Enter City',
                  title: 'n',
                ),

                // EdgeInsets.fromViewPadding(
                //                 WidgetsBinding.instance.window.viewInsets,
                //                 WidgetsBinding.instance.window.devicePixelRatio)
                //             .bottom ==
                //         0
                //     ? 0.sizeHeight
                //     :
                20.sizeHeight,
                Text(
                  ' Country/Region',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                5.sizeHeight,

                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8)),
                  child: phoneCodePicker(),
                ),
                10.sizeHeight,
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
                ],
              ),
              AppButton(
                radius: 8,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KYCVerification3()));
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

  Widget addressTextField({
    required String? hintText,
    Widget? icon,
    required bool obscureText,
    required TextInputType? myType,
    String? Function(String?)? validator,
    FocusNode? focusNode,
    required TextEditingController controller,
  }) {
    return Card(
      color: Colors.grey.shade100,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
        child: TextFormField(
          minLines: 2,
          maxLines: null,
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          keyboardType: myType,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: icon,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
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
