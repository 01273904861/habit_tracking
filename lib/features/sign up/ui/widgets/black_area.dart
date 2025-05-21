import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';

class SignUpBlackArea extends StatelessWidget {
  const SignUpBlackArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: Center(
        child: Text(
          "Register",
          style: AppTextstyles.headerStyle,
        ),
      ),
    );
  }
}
