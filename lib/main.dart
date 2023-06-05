import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/ui/update_and_maintenance/checking_maintanance.dart';
import 'package:papi_network/view_model/auth_view_model.dart';
import 'package:papi_network/view_model/maintenance_view_model.dart';
import 'package:papi_network/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => MaintenanceViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => MaintenanceViewModel()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          // minTextAdapt: true,
          // splitScreenMode: true,
          builder: (context, _) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                unselectedWidgetColor: Colors.green,
              ),
              debugShowCheckedModeBanner: false,
              home: const CheckingMaintenance(),
            );
          }),
    );
  }
}
