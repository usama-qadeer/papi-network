import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:papi_network/widgets/register_text_field.dart';

import '../constants/app_colors.dart';

class CountryPicker extends StatefulWidget {
  String? countryPhoneCode;
  String? countryName;
  CountryPicker(
      {required this.countryPhoneCode, required this.countryName, Key? key})
      : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' Phone No',
          style: TextStyle(fontSize: 14, color: Colors.grey, letterSpacing: 2),
        ),
        Container(
          // height: 61,
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
                          useSafeArea: true,
                          context: context,
                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            setState(() {
                              widget.countryPhoneCode = country.phoneCode;
                              widget.countryName = country.name;
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
                                  '+ ${widget.countryPhoneCode}',
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
                    controller: controller, hintText: '', title: 'n'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
