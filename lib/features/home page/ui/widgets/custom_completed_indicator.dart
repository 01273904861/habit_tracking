import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCompletedIndicator extends StatelessWidget {
  const CustomCompletedIndicator({
    super.key,
    required this.percent,
    required this.image,
  });

  final double percent;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: percent,
      lineWidth: 2.0.w,
      progressColor: AppColors.mainBlue,
      circularStrokeCap: CircularStrokeCap.round,
      center: Image.asset(
        image,
        width: 35.w,
      ),
      radius: 45.r,
    );
  }
}