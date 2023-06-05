import 'package:flutter/material.dart';
import 'package:papi_network/ui/user_profile_screens/account_and_security/login_tabs.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/my_app_bar.dart';

class AccountAndSecurity extends StatefulWidget {
  const AccountAndSecurity({Key? key}) : super(key: key);

  @override
  State<AccountAndSecurity> createState() => _AccountAndSecurityState();
}

class _AccountAndSecurityState extends State<AccountAndSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: MyAppBar.appBar(context,
                txt: 'Account & Security',
                backGroundColor: AppColors.pinkPurpleAppBar,
                textAndIconsColor: Colors.white, onPressed: () {
              Navigator.pop(context);
            }),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  myTile(
                      leading: Icon(
                        Icons.phone_rounded,
                        size: 35,
                        color: Colors.black,
                      ),
                      title: 'Bind with Phone number',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginSecurityScreenTabs(iniIndex: 0)));
                      }),
                  myTile(
                      leading: Icon(
                        Icons.email_outlined,
                        size: 35,
                        color: Colors.black,
                      ),
                      title: 'Bind with Email',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginSecurityScreenTabs(iniIndex: 1)));
                      }),
                  myTile(
                      leading: Image.asset('assets/icons/facebook2.png'),
                      title: 'Bind with facebook',
                      onTap: () {}),
                  myTile(
                      leading: Image.asset('assets/icons/google.png'),
                      title: 'Bind with Google',
                      onTap: () {}),
                  myTile(
                      leading: Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 35,
                        color: Colors.black,
                      ),
                      title: 'Bind with Wallet',
                      onTap: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget myTile(
      {required Widget leading,
      required String title,
      required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bind Now',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              )
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.arrow_forward_ios_rounded,
              //       size: 18,
              //     )),
            ],
          ),
          leading: leading,
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
