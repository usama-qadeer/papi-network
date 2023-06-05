import 'package:flutter/material.dart';
import 'package:papi_network/ui/auth/help/help_screen_7.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/bollet_title.dart';
import '../../../widgets/my_app_bar.dart';

class HelpScreen6 extends StatefulWidget {
  const HelpScreen6({Key? key}) : super(key: key);

  @override
  State<HelpScreen6> createState() => _HelpScreen6State();
}

class _HelpScreen6State extends State<HelpScreen6> {
  bool bool1 = false;
  bool bool2 = false;
  bool bool3 = false;
  bool bool4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'Restore Account (2/2)',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletTitle(title: 'Request Account Recovery'),
              15.sizeHeight,
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.pinkShade,
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: AppColors.purpleTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          ),
                          TextSpan(
                              text: 'Enter your inviter’s invitation code.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(hintText: 'Invitation Code')
                  ],
                ),
              ),
              17.sizeHeight,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: 'Select 1 member(S) of your team.'),
                  ],
                ),
              ),
              15.sizeHeight,
              Row(
                children: [
                  myRadioButton(
                      txt: 'Hamid Ali',
                      onTap: () {
                        setState(() {
                          bool1 = true;
                          bool2 = false;
                          bool3 = false;
                          bool4 = false;
                        });
                      },
                      boolValue: bool1),
                  65.sizeWith,
                  myRadioButton(
                      txt: 'Hamid Ali',
                      onTap: () {
                        setState(() {
                          bool1 = false;
                          bool2 = true;
                          bool3 = false;
                          bool4 = false;
                        });
                      },
                      boolValue: bool2),
                ],
              ),
              14.sizeHeight,
              Row(
                children: [
                  myRadioButton(
                      txt: 'Hamid Ali',
                      onTap: () {
                        setState(() {
                          bool1 = false;
                          bool2 = false;
                          bool3 = true;
                          bool4 = false;
                        });
                      },
                      boolValue: bool3),
                  65.sizeWith,
                  myRadioButton(
                      txt: 'Hamid Ali',
                      onTap: () {
                        setState(() {
                          bool1 = false;
                          bool2 = false;
                          bool3 = false;
                          bool4 = true;
                        });
                      },
                      boolValue: bool4),
                ],
              ),
              21.sizeHeight,
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.pinkShade,
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: AppColors.purpleTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          ),
                          TextSpan(
                              text:
                                  'Enter the email so you can receive the result of the application.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(hintText: 'Email Address')
                  ],
                ),
              ),
              Text(
                'How many teammates do you have?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              12.sizeHeight,
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/sub.png',
                      height: 14,
                    ),
                    Text('01'),
                    Image.asset(
                      'assets/icons/add.png',
                      height: 14,
                    ),
                    Text('members'),
                  ],
                ),
              ),
              36.sizeHeight,
              Text(
                'How many Papis do you have in your account?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              12.sizeHeight,
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/sub.png',
                      height: 14,
                    ),
                    Text('01'),
                    Image.asset(
                      'assets/icons/add.png',
                      height: 14,
                    ),
                    Text('PAPI(s)    '),
                  ],
                ),
              ),
              36.sizeHeight,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 35),
        child: AppButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HelpScreen7(),
              ),
            );
          },
          child: Text('Submit'),
          width: double.infinity,
        ),
      ),
    );
  }

  Widget myRadioButton(
      {required String txt,
      required VoidCallback onTap,
      required bool boolValue}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 23,
            width: 23,
            decoration: BoxDecoration(
                color: AppColors.pinkPurpleAppBar,
                borderRadius: BorderRadius.circular(11)),
            child: Center(
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: boolValue == false
                        ? Colors.white
                        : AppColors.pinkPurpleAppBar,
                    borderRadius: BorderRadius.circular(11)),
              ),
            ),
          ),
          8.sizeWith,
          Text(
            txt,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
