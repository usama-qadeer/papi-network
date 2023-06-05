import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundImage extends StatelessWidget {
  String? imageName;
  BackgroundImage({this.imageName = 'Up', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageName == 'NoFoots'
          ? 'assets/images/backgroundGradiant.svg'
          : imageName == 'GrayUp'
              ? 'assets/images/backgroundgrayUp.svg'
              : imageName == 'GrayDown'
                  ? 'assets/images/backgroundgrayDown.svg'
                  : imageName == 'Down'
                      ? 'assets/images/backgroundDown.svg'
                      : 'assets/images/backgroundimage.svg',
      fit: BoxFit.cover,
    );
  }
}
