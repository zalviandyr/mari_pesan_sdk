import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Metrics {
  static EdgeInsets defaultPadding =
      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h);

  static EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets horizontalInsetPadding =
      EdgeInsets.symmetric(horizontal: 12.h);

  static EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets verticalInsetPadding = EdgeInsets.symmetric(vertical: 12.h);

  static SizedBox horizontalSizedBox = SizedBox(width: 24.w);
  static SizedBox horizontalDenseSizedBox = SizedBox(width: 12.w);
  static SizedBox verticalSizedBox = SizedBox(height: 24.h);
  static SizedBox verticalDenseSizedBox = SizedBox(height: 12.w);

  static const double capsuleMinWidth = 75;
}
