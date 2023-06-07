import 'package:flutter/material.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/widgets/background_image.dart';
import 'package:papi_network/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_text_field.dart';

class InvitationCodeAndUsername extends StatefulWidget {
  const InvitationCodeAndUsername({Key? key}) : super(key: key);

  @override
  State<InvitationCodeAndUsername> createState() =>
      _InvitationCodeAndUsernameState();
}

class _InvitationCodeAndUsernameState extends State<InvitationCodeAndUsername> {
  TextEditingController usernameC = TextEditingController();
  late var nickNameData = Provider.of<AuthProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Set your username',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.purpleTextColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This will also be your invitation code for inviting others',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.pink, AppColors.blue]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomTextField(
                          controller: usernameC,
                          height: 48,
                          hintText: '@username',
                          title: 'n',
                        ),
                      ),
                    ),
                  ),
                  myBulletLine(txt: 'From 4 to 20 characters.'),
                  myBulletLine(txt: 'User may contain letters and numbers.'),
                  myBulletLine(
                      txt:
                          'User cannot contain special characters and emojis.'),
                  myBulletLine(
                      txt: 'n',
                      child: RichText(
                          text: TextSpan(
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                              children: [
                            TextSpan(text: 'This is your '),
                            TextSpan(
                              text: 'personal ',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.redAccent),
                            ),
                            TextSpan(
                                text: 'username and invitation code. it’s '),
                            TextSpan(
                              text: 'important ',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.redAccent),
                            ),
                            TextSpan(text: 'and '),
                            TextSpan(
                              text: 'cannot be changed ',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.redAccent),
                            ),
                            TextSpan(text: 'after setting.'),
                          ])))
                  // Container(
                  //   width: double.infinity,
                  //   height: 55,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         colors: [AppColors.pink, AppColors.blue]),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),

                  //   child: Padding(
                  //     padding: const EdgeInsets.all(1.0),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.grey.shade100,
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: CustomTextField(
                  //           height: 48, hintText: 'Enter code', title: 'n'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          color: Colors.transparent,
          height: 99,
          child: Center(
            child: AppButton(
              onPressed: () {
                nickNameData.createUserNickname();
                // AuthProvider().createUserNickname();
                Navigator.pop(context);
                //setState(() {});
              },
              child: Text('Save'),
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }

  Widget myBulletLine({required String txt, Widget? child}) {
    return Column(
      children: [
        SizedBox(
          height: 11,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.only(top: 4, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11), color: Colors.grey),
            ),
            Expanded(
              child: txt == 'n'
                  ? child!
                  : Text(
                      txt,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
