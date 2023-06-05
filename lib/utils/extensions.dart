import 'package:flutter/cupertino.dart';

extension SizedBoxExtension on num {
  SizedBox get sizeWith => SizedBox(
        width: toDouble(),
      );
  SizedBox get sizeHeight => SizedBox(
        height: toDouble(),
      );
}
