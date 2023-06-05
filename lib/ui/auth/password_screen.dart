import 'package:flutter/material.dart';
import 'package:papi_network/ui/auth/verification_tabs.dart';
import 'package:papi_network/utils/utils.dart';
import 'package:papi_network/view_model/auth_view_model.dart';
import 'package:papi_network/widgets/app_button.dart';
import 'package:papi_network/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/background_image.dart';
import '../../widgets/my_app_bar.dart';

class PasswordScreen extends StatefulWidget {
  String? email;
  String? phone;
  PasswordScreen({this.email, this.phone, Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                    'Please verify your Password',
                    style:
                        TextStyle(fontSize: 16, color: AppColors.blueTextColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
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
                          obscureText: authProvider.passwordVisibility,
                          controller: _passwordController,
                          hintText: 'Password',
                          title: 'n',
                          icon: InkWell(
                            onTap: () {
                              authProvider.setPasswordVisibility(
                                  !authProvider.passwordVisibility);
                            },
                            child: Icon(authProvider.passwordVisibility
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text('Forget Password',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationTabs(
                                        iniIndex: 0,
                                      )));
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  AppButton(
                    onPressed: () async {
                      final SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      final String? token = sp.getString('token');

                      if (_passwordController.text.isNotEmpty) {
                        if (widget.phone.toString().length > 6) {
                          Map data = {
                            'phone': widget.phone.toString(),
                            'password': _passwordController.text.toString(),
                          };

                          await authViewModel.loginApi(
                            context,
                            data: data,
                          );
                        } else {
                          Map data = {
                            'email': widget.email.toString(),
                            'password': _passwordController.text.toString(),
                          };

                          await authViewModel.loginApi(
                            context,
                            data: data,
                          );
                        }

                        // authProvider.loginWithEmail(
                        //   context,
                        //   email: widget.email.toString(),
                        //   password: _passwordController.text.toString(),
                        // );
                      } else {
                        Utils.flutterToast('Enter Password');
                      }

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             BottomNavigationBarForApp()));
                    },
                    child: authViewModel.loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Confirm'),
                    width: double.infinity,
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
