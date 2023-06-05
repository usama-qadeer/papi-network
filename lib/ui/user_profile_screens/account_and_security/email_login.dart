import 'package:flutter/material.dart';
import 'package:papi_network/widgets/app_button.dart';
import 'package:papi_network/widgets/custom_text_field.dart';

import '../../../constants/app_colors.dart';
import 'otp_screen.dart';

class EmailLoginSecurityScreen extends StatefulWidget {
  const EmailLoginSecurityScreen({Key? key}) : super(key: key);

  @override
  State<EmailLoginSecurityScreen> createState() =>
      _EmailLoginSecurityScreenState();
}

class _EmailLoginSecurityScreenState extends State<EmailLoginSecurityScreen> {
  final FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    emailFocusNode.requestFocus();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [AppColors.pink, AppColors.blue]),
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
                    focusNode: emailFocusNode,
                    height: 48,
                    hintText: 'Email',
                    title: 'n',
                  ),
                ),
              ),
            ),
            Spacer(),
            AppButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTPSecurityScreen()));
              },
              child: Text('Next'),
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
