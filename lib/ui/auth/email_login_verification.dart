import 'package:flutter/material.dart';
import 'package:papi_network/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/app_button.dart';

class EmailLoginVerification extends StatefulWidget {
  const EmailLoginVerification({Key? key}) : super(key: key);

  @override
  State<EmailLoginVerification> createState() => _EmailLoginVerificationState();
}

class _EmailLoginVerificationState extends State<EmailLoginVerification> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify',
              style: TextStyle(color: AppColors.blue, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              // height: 50,
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
                      hintText: 'Email',
                      title: 'n'),
                ),
              ),
            ),
            Spacer(),
            AppButton(
              onPressed: () {
                if (_emailController.text.isNotEmpty) {
                  Map data = {
                    'email': _emailController.text.toString().trim(),
                  };

                  authViewModel.forgetApi(context, data: data);
                } else {
                  Utils.flutterToast('Enter your email');
                }
              },
              width: double.infinity,
              child: authViewModel.loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text('Send Code'),
            )
          ],
        ),
      ),
    );
  }
}
