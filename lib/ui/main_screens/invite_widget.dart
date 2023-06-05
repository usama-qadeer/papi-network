import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'invite_screen.dart';

class InviteWidget extends StatelessWidget {
  const InviteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InviteScreen()));
      },
      child: Container(
        height: 80,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.person_add_alt,
              color: Colors.white,
              size: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Earn extra 25% / active miner in your',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'team. Bonus rate uncapped.',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Start inviting',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.yellow),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
