import 'package:flutter/material.dart';

class AppBigButton extends StatelessWidget {
  String? title;
  VoidCallback? onPressed;
  AppBigButton({required this.onPressed, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 53,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title!,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // <-- Radius
            ),
          ),
        ));
  }
}
