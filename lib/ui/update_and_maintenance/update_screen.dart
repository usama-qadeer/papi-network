import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/utils/extensions.dart';
import 'package:papi_network/widgets/background_image.dart';

import '../../widgets/app_button.dart';
import '../../widgets/bordered_app_button.dart';
import 'change_log_screen.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(imageName: 'GrayUp'),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    35.sizeHeight,
                    Image.asset(
                      'assets/images/update.png',
                      height: 350,
                      // fit: BoxFit.cover,
                    ),
                    82.sizeHeight,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          BorderedAppButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeLogScreen()));
                            },
                            child: Text(
                              'Change Log',
                              style: TextStyle(color: AppColors.pink),
                            ),
                            width: double.infinity,
                          ),
                          18.sizeHeight,
                          AppButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Update'),
                            height: 51,
                            width: double.infinity,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Not now',
                              style: TextStyle(
                                  color: AppColors.pink, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
