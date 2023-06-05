// ignore_for_file: unused_local_variable, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/utils/utils.dart';
import 'package:papi_network/view_model/auth_view_model.dart';
import 'package:papi_network/widgets/background_image.dart';
import 'package:papi_network/widgets/my_app_bar.dart';
import 'package:papi_network/widgets/register_text_field.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../widgets/app_button.dart';
import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? countryPhoneCode = '92';
  String? countryName = 'Pakistan';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool phoneValue = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: MyAppBar.appBar(context, txt: '', onPressed: () {
        Navigator.pop(context);
      }),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundImage(),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Register',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text(
                                  'Create your account',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.blueTextColor),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                LoginTextField(
                                    controller: _nameController,
                                    validator: (String? txt) {
                                      if (txt == null || txt.isEmpty) {
                                        return "Please provide your Name";
                                      }
                                      return null;
                                    },
                                    myType: TextInputType.text,
                                    hintText: 'Anung Jagatara',
                                    title: 'Your Name'),
                                LoginTextField(
                                    controller: _emailController,
                                    validator: (String? txt) {
                                      bool emailValid = RegExp(
                                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                          .hasMatch(txt!);
                                      if (txt == null || txt.isEmpty) {
                                        return "Please provide your Email";
                                      }
                                      if (emailValid) {
                                        return null;
                                      }
                                      return "Your Email is Wrong";
                                    },
                                    // validator: (String? txt) {
                                    //   if (txt == null || txt.isEmpty) {
                                    //     return "Please provide your Email";
                                    //   }
                                    //   return null;
                                    // },
                                    hintText: 'anung@jagatara.com',
                                    title: 'Email'),
                                countryPicker(),
                                phoneCodePicker(),
                                const SizedBox(
                                  height: 5,
                                ),
                                LoginTextField(
                                    controller: _passwordController,
                                    validator: (String? txt) {
                                      if (txt == null || txt.isEmpty) {
                                        return "Please provide your Password";
                                      }
                                      return null;
                                    },
                                    hintText: '******',
                                    title: 'Password',
                                    obscureText:
                                        authProvider.passwordVisibility,
                                    icon: InkWell(
                                      onTap: () {
                                        authProvider.setPasswordVisibility(
                                            !authProvider.passwordVisibility);
                                      },
                                      child: Icon(
                                          authProvider.passwordVisibility
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined),
                                    )
                                    // ImageIcon(
                                    //   AssetImage('assets/icons/eyeClose.png'),
                                    //   size: 22,
                                    // ),
                                    ),
                                const SizedBox(height: 250)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: Container(
        height: 90,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppButton(
                onPressed: () async {
                  // Utils.flutterToast('message');

                  if (_formKey.currentState!.validate()) {
                    if (_phoneController.text.isNotEmpty) {
                      authProvider.setLoading(true);
                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString(),
                        'name': _nameController.text.toString(),
                        'phone': '+$countryPhoneCode${_phoneController.text}',
                        'country': countryName,
                        'country_code': '+$countryPhoneCode',
                      };
                      // await authViewModel.registerApi(
                      //   context,
                      //   data: data,
                      // );

                      FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber:
                            '+$countryPhoneCode${_phoneController.text}',
                        verificationCompleted: (_) {},
                        verificationFailed: (e) {
                          authProvider.setLoading(false);
                          Utils.flutterToast(
                              'verificationFailed: ' + e.toString());
                        },
                        codeSent: (String verification, int? token) {
                          authProvider.setLoading(false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPScreen(
                                        verificationId: verification,
                                        data: data,
                                      )));
                        },
                        codeAutoRetrievalTimeout: (e) {
                          authProvider.setLoading(false);
                          Utils.flutterToast(
                              'codeAutoRetrievalTimeout: ' + e.toString());
                        },
                      );

                      /* authProvider.register(
                        context,
                        email: _emailController.text.toString(),
                        password: _passwordController.text.toString(),
                        name: _nameController.text.toString(),
                      ); */
                    } else {
                      Utils.flutterToast('Enter phone number');
                    }
                  } else {
                    Utils.flutterToast('Please fill all the fields');
                  }
                },
                child: authProvider.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Sign Up'),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///**********************   Phone Code Picker   ********************

  Widget phoneCodePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ' Phone No',
          style: TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 2),
        ),
        Container(
          // height: 61,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              const SizedBox(
                width: 11,
              ),

              /// Country Phone Code
              SizedBox(
                height: 40,
                width: 70,
                child: InkWell(
                    onTap: () {
                      showCountryPicker(
                        countryListTheme: const CountryListThemeData(
                            margin: EdgeInsets.only(top: 50)),
                        useSafeArea: true,
                        context: context,
                        showPhoneCode:
                            true, // optional. Shows phone code before the country name.
                        onSelect: (Country country) {
                          setState(() {
                            countryPhoneCode = country.phoneCode;
                            countryName = country.name;
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
                                '+ $countryPhoneCode',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purpleTextColor),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.purpleTextColor,
                              )
                            ],
                          ),
                        ))),
              ),

              Expanded(
                child: SizedBox(
                  child: LoginTextField(
                      controller: _phoneController,
                      validator: (String? txt) {
                        if (txt == null || txt.isEmpty) {
                          phoneValue = false;
                        } else {
                          phoneValue = true;
                          return null;
                        }
                        return null;
                      },
                      hintText: 'Phone Number',
                      title: 'n'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///**********************   Country Picker   ********************
  Widget countryPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ' Country',
          style: TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 2),
        ),
        Card(
          color: Colors.grey.shade100,
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
            child: SizedBox(
              height: 51,
              // width: 70,
              child: InkWell(
                onTap: () {
                  showCountryPicker(
                    countryListTheme: const CountryListThemeData(
                        margin: EdgeInsets.only(top: 50)),

                    // showSearch: false,
                    useSafeArea: true,
                    context: context,
                    showPhoneCode:
                        true, // optional. Shows phone code before the country name.
                    onSelect: (Country country) {
                      setState(() {
                        countryPhoneCode = country.phoneCode;
                        countryName = country.name;
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$countryName',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.purpleTextColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
