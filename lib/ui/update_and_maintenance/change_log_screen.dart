import 'package:flutter/material.dart';

class ChangeLogScreen extends StatefulWidget {
  const ChangeLogScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLogScreen> createState() => _ChangeLogScreenState();
}

class _ChangeLogScreenState extends State<ChangeLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/backgroundGradiant.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Text('HTML Page'),
          )
        ],
      ),
    );
  }
}
