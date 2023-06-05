import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papi_network/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.checkAuthentication(context);

    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (BuildContext context) => SignUp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/backgroundimage.svg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              'assets/images/Logoimage2.png',
              height: 120,
              // fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
