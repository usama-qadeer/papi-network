import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? title;
  VoidCallback? onPressed;
  double? height;
  double? width;
  double? borderRadius;
  Color? btnColor;

  CustomButton(
      {this.height = 27,
      this.width = 94,
      this.borderRadius = 0,
      this.btnColor = Colors.blue,
      required this.onPressed,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title!,
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!), // <-- Radius
            ),
          ),
        ));
  }
}
