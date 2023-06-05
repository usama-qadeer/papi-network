import 'package:flutter/material.dart';
import 'package:papi_network/utils/utils.dart';
import 'package:papi_network/view_model/auth_view_model.dart';
import 'package:papi_network/widgets/app_button.dart';
import 'package:papi_network/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../widgets/background_image.dart';
import '../../widgets/my_app_bar.dart';

class UpdatePassword extends StatefulWidget {
  final String phoneOrEmailAddress;
  final String id;

  const UpdatePassword(
      {required this.id, required this.phoneOrEmailAddress, Key? key})
      : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final TextEditingController _updatePasswordController =
      TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            appBar: MyAppBar.appBar(context, txt: 'Password', onPressed: () {
              Navigator.pop(context);
            }),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update your Password',
                    style:
                        TextStyle(fontSize: 16, color: AppColors.blueTextColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    // height: 64,
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
                        child: ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (context, value, child) {
                            return CustomTextField(
                              controller: _updatePasswordController,
                              height: 50,
                              obscureText: _obscurePassword.value,
                              hintText: 'Password',
                              title: 'n',
                              icon: InkWell(
                                  onTap: () {
                                    _obscurePassword.value =
                                        !_obscurePassword.value;
                                  },
                                  child: Icon(_obscurePassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  AppButton(
                    onPressed: () {
                      if (_updatePasswordController.text.length >= 6) {
                        Map data = {
                          'id': widget.id,
                          'password': _updatePasswordController.text.toString()
                        };
                        authViewModel.updatePasswordApi(context, data: data);
                      } else {
                        Utils.flutterToast(
                            'Password must be greater than 6 digit');
                      }

                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    width: double.infinity,
                    child: authViewModel.loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Confirm'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
