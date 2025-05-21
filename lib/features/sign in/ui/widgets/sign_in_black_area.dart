
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';

class SignInBlackArea extends StatelessWidget {
  const SignInBlackArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
    verticalSpace(30),
          Text("Login Account", style: AppTextstyles.font16WhiteSemiBold),
          verticalSpace(2),
          Text(
            "Welcome back To Application",
            style: AppTextstyles.font13Greyregular.copyWith(color: Colors.white),
          ),
          verticalSpace(50.h),
          Center(
            child: Text(
              "Login",
              style: AppTextstyles.headerStyle,
            ),
          ),
        ],
      ),
    );
  }
}
