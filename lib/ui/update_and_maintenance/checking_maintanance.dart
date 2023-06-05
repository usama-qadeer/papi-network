import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../services/splash_services.dart';
import '../../view_model/maintenance_view_model.dart';

class CheckingMaintenance extends StatefulWidget {
  const CheckingMaintenance({Key? key}) : super(key: key);

  @override
  State<CheckingMaintenance> createState() => _CheckingMaintenanceState();
}

class _CheckingMaintenanceState extends State<CheckingMaintenance> {
  MaintenanceViewModel maintenanceViewModel = MaintenanceViewModel();
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // splashServices.checkAuthentication(context);
    maintenanceViewModel.fetchMaintenanceApi();
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
          ChangeNotifierProvider<MaintenanceViewModel>(
            create: (BuildContext context) => maintenanceViewModel,
            child: Consumer<MaintenanceViewModel>(
              builder: (context, value, child) {
                switch (value.maintenanceData.status) {
                  case Status.LOADING:
                    return const SizedBox();
                  // Center(
                  //   heightFactor: 15, child: CircularProgressIndicator());
                  case Status.ERROR:
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 222,
                        child: Center(
                            child:
                                Text(value.maintenanceData.message.toString())),
                      ),
                    );
                  case Status.COMPLETED:
                    splashServices.checkMaintenance(
                      context,
                      value.maintenanceData.data!.userDetails![0].maintainceMode
                          .toString(),
                    );
                    return Center(
                      heightFactor: 33,
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: const Text(''
                            // value.maintenanceData.data!.userDetails![0]
                            // .maintainceMode
                            // .toString()
                            ),
                      ),
                    );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
