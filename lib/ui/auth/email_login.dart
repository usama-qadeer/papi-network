import 'package:flutter/material.dart';
import 'package:papi_network/ui/auth/password_screen.dart';
import 'package:papi_network/utils/utils.dart';
import 'package:papi_network/widgets/app_button.dart';
import 'package:papi_network/widgets/custom_text_field.dart';

import '../../constants/app_colors.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final FocusNode emailFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();

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
                    controller: _emailController,
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
                if (_emailController.text.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordScreen(
                                email: _emailController.text,
                              )));
                } else {
                  Utils.flutterToast('Enter your email');
                }
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
