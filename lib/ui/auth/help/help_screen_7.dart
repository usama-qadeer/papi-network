import 'package:flutter/material.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/my_app_bar.dart';
import '../login_tabs.dart';

class HelpScreen7 extends StatelessWidget {
  const HelpScreen7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'Restore Account (1/2)',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      }),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/done.png',
                height: 100,
              ),
              50.sizeHeight,
              Text(
                  'You have successfully submit the application for account restoring.',
                  textAlign: TextAlign.center),
              Text(
                  'We will inform you the result via email within 3 working day.',
                  textAlign: TextAlign.center),
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
}
