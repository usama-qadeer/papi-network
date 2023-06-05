import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final double radius;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.radius = 10,
    this.width,
    this.height = 51.0,
    this.gradient =
        const LinearGradient(colors: [AppColors.pink, AppColors.blue]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: child,
      ),
    );
  }
}
