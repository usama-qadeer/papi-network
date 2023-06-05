import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/ui/splash_screen.dart';
import 'package:papi_network/utils/extensions.dart';
import 'package:papi_network/widgets/background_image.dart';

import '../../widgets/app_button.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  // TestViewModel testViewModel = TestViewModel();
  //
  // @override
  // void initState() {
  //   testViewModel.fetchTestApi();
  // }

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
                    Image.asset(
                      'assets/images/Logoimage2.png',
                      height: 80,
                      // fit: BoxFit.cover,
                    ),
                    35.sizeHeight,
                    // ChangeNotifierProvider<TestViewModel>(
                    //   create: (BuildContext context) => testViewModel,
                    //   child: Consumer<TestViewModel>(
                    //     builder: (context, value, child) {
                    //       switch (value.testGet.status) {
                    //         case Status.LOADING:
                    //           return CircularProgressIndicator();
                    //         case Status.ERROR:
                    //           return Text(value.testGet.message.toString());
                    //         case Status.COMPLETED:
                    //           return Container(
                    //             child: Text(value.testGet.data!.data![3].email
                    //                 .toString()),
                    //           );
                    //       }
                    //       return Container();
                    //     },
                    //   ),
                    // ),
                    Image.asset(
                      'assets/images/maintenance.png',
                      height: 225,
                      // fit: BoxFit.cover,
                    ),
                    50.sizeHeight,
                    Text(
                      'Maintenance',
                      style: TextStyle(
                          color: AppColors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    10.sizeHeight,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 43.0),
                      child: Text(
                        'We are currently undergoing maintenance this won\’t take long ',
                        style: TextStyle(color: AppColors.pink, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30.0),
        child: AppButton(
          // radius: 2,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SplashScreen()));
          },
          child: Text('Ok'),
          height: 51,
        ),
      ),
    );
  }
}
